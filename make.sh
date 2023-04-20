#!/usr/bin/env bash

set -euo pipefail

run_cmd() {
    echo "-- $*"
    "$@"
}

enable_push=0
if [[ "$1" = --push ]]; then
    enable_push=1
    shift
fi

image_path="$1"
image_name=rocstreaming/$(basename "$image_path")

cd "$image_path"

num_images="$(sed 1d images.csv | wc -l | cut -d' ' -f1)"
cur_image=1

{ cat images.csv; echo; } | grep '\S' | {
    read header
    while IFS=";" read -r dockerfile args tag; do
        if [ -z "$dockerfile" ]; then
            dockerfile="Dockerfile"
        fi

        if [ -z "$tag" ]; then
            tag="$(cut -d "/" -f1 <<< "$dockerfile")"
        fi

        context="."
        depth="$(awk -F"/" '{print NF-1}' <<< "$dockerfile")"
        if [ "$depth" != "0" ]; then
            context="$(cut -d "/" -f1 <<< "$dockerfile")"
        fi

        printf '%s \033[1;35m[%d/%d] processing image %s\033[0m\n' \
               "--" "$cur_image" "$num_images" "$image_name:$tag"

        build_args=(
            --pull
            -f "$dockerfile"
            -t "$image_name:$tag"
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

        run_cmd docker buildx build "${build_args[@]}"

        if [[ "$enable_push" = 1 ]]; then
            run_cmd docker push "$image_name:$tag"
        fi

        (( cur_image++ ))
    done
}

printf '%s \033[1;35msuccessfully processed %d image(s)\033[0m\n' \
       "--" "$num_images"
