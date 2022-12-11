#!/usr/bin/env bash

set -euo pipefail

run_cmd() {
    echo "-- $*"
    "$@"
}

image=rocstreaming/$(basename "$(pwd)")

{ cat images.csv; echo; } | grep '\S' | {
    read header
    while IFS=";" read -r dockerfile args tag; do
        IFS="," read -ra args_list <<< "$args"
        build_args=""
        for arg in "${args_list[@]}"; do
            arg="${arg/ /_}"
            build_args="$build_args --build-arg $arg"
        done
        if [ -z "$dockerfile" ]; then
            dockerfile="Dockerfile"
        else
            if [ -z "$tag" ]; then
                tag="$(cut -d "/" -f1 <<< "$dockerfile")"
            fi
        fi
        context=.
        depth="$(awk -F"/" '{print NF-1}' <<< "$dockerfile")"
        if [ "$depth" != "0" ]; then
            context="$(cut -d "/" -f1 <<< "$dockerfile")"
        fi
        if [ ! -z "$build_args" ]; then
            run_cmd docker build --pull -f "$dockerfile" $build_args -t "$image:$tag" "$context"
        else
            run_cmd docker build --pull -f "$dockerfile" -t "$image:$tag" "$context"
        fi
    done
}

