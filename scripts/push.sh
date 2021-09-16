#!/bin/bash
set -euo pipefail

run_cmd() {
    echo "-- $*"
    "$@"
}

image=rocstreaming/$(basename "$(pwd)")

{ cat images.csv; echo; } | grep '\S' | {
    read header
    while IFS=";" read -r dockerfile args tag; do
        if [ -z "$tag" ]; then
            tag=$(cut -d "/" -f1 <<< $dockerfile)
        fi
        run_cmd docker push $image:$tag
    done
}
