#!/usr/bin/env bash

set -euo pipefail

action="${1:?action needed}"

root_dir="$(cd $(dirname "$0")/.. && pwd)"
cd "$root_dir"

images="$(find -type f -name images.csv | sort)"

num_images="$(echo $images | tr ' ' '\n' | wc -l)"
cur_image=1

for image_spec in $images; do
    image_dir="$(dirname "$image_spec")"
    image_name="$(basename "$image_dir")"

    printf '%s \033[1;34m[%d/%d] processing image %s\033[0m\n' \
           "--" "$cur_image" "$num_images" "$image_name"

    cd "$root_dir/$image_dir"

    case "$action" in
    (--build)
        "$root_dir/scripts/build.sh"
        ;;
    (--push)
        "$root_dir/scripts/push.sh"
        ;;
    esac

    (( cur_image++ ))
done

printf '%s \033[1;34msuccessfully processed %d images\033[0m\n' \
       "--" "$num_images"
