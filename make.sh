#!/usr/bin/env bash

set -euo pipefail

run_cmd() {
    dry_run="$1"
    shift
    echo "-- $*"
    if [ "$dry_run" = 0 ]; then
        "$@" || exit 1
    fi
}

help() {
    echo "Usage: $0 [OPTIONS...] [IMAGE[:TAG]...]"
    echo
    echo "   -n, --dry-run       don't run commands, just print them"
    echo "   -p, --push          push image after building"
    echo "   -C, --no-cache      pass --no-cache to docker build"
    echo "   -P, --no-pull       don't pass --pull to docker build"
    echo "   -h, --help          print this message"
    echo
}

dry_run=0
no_cache=0
no_pull=0
enable_push=0

while [ "${1:-}" != "" ]; do
    case "$1" in
        "-h"|"--help")
            help
            exit
            ;;
        "-n"|"--dry-run")
            dry_run=1
            ;;
        "-p"|"--push")
            enable_push=1
            ;;
        "-C"|"--no-cache")
            no_cache=1
            ;;
        "-P"|"--no-pull")
            no_pull=1
            ;;
        *)
            break
            ;;
    esac
    shift
done

cd "$(dirname "$0")"

if [ -z "${1:-}" ]; then
    ls -1 images | sort
else
    for image in "$@"; do
        echo "$image"
    done
fi | while read image; do
    if echo "$image" | grep -qF ":"; then
        image_shortname="$(echo "$image" | cut -d: -f1)"
        image_tag="$(echo "$image" | cut -d: -f2)"
    else
        image_shortname="$image"
        image_tag=""
    fi
    image_fullname="rocstreaming/$image_shortname"
    image_dir="images/$image_shortname"

    pushd "$image_dir" >/dev/null

    { cat images.csv; echo; } | grep '\S' | {
        read header
        while IFS=";" read -r dockerfile args tag; do
            if [ -z "$dockerfile" ]; then
                dockerfile="Dockerfile"
            fi

            if [ -z "$tag" ]; then
                tag="$(cut -d "/" -f1 <<< "$dockerfile")"
            fi

            if [ ! -z "$image_tag" ] && [ "$tag" != "$image_tag" ]; then
                continue
            fi

            context="."
            depth="$(awk -F"/" '{print NF-1}' <<< "$dockerfile")"
            if [ "$depth" != "0" ]; then
                context="$(cut -d "/" -f1 <<< "$dockerfile")"
            fi

            printf '%s \033[1;35mprocessing image %s\033[0m\n' \
                   "--" "$image_fullname:$tag"

            build_args=()

            if [ "$no_pull" = 0 ]; then
                build_args+=(
                    --pull
                )
            fi

            if [ "$no_cache" = 1 ]; then
                build_args+=(
                    --no-cache
                )
            fi

            build_args+=(
                -f "$dockerfile"
                -t "$image_fullname:$tag"
                --output "type=docker"
            )

            if [ ! -z "${CACHE_FROM:-}" ]; then
                build_args+=(
                    --cache-from "type=local,src=${CACHE_FROM}"
                    --cache-to "type=local,dest=${CACHE_TO}"
                )
            fi

            IFS="," read -ra args_list <<< "$args"
            for arg in "${args_list[@]}"; do
                arg="${arg/ /_}"
                build_args+=(
                    --build-arg "$arg"
                )
            done

            build_args+=(
                "$context"
            )

            run_cmd "$dry_run" docker buildx build "${build_args[@]}"

            if [[ "$enable_push" = 1 ]]; then
                run_cmd "$dry_run" docker push "$image_fullname:$tag"
            fi
        done
    }

    popd>/dev/null
done
