#!/usr/bin/env bash

set -euo pipefail

SETTINGS="$(pwd)/settings.json"

for repo in $(jq -r '.repos|keys|.[]' $SETTINGS); do
    pushd "${repo}"

    OLD_IFS=$IFS; IFS=$'\n'
    for cmd in $(jq -r ".repos.${repo}.setup|.[]" $SETTINGS); do
        bash -c "${cmd}"
    done
    IFS=$OLD_IFS

    popd
done
