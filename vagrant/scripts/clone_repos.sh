#!/usr/bin/env bash

set -euo pipefail

pushd vagrant

git clone https://github.com/brendangregg/FlameGraph.git

for repo in $(jq -r '.repos|keys|.[]' settings.json); do
    jq -r ".repos.${repo}.url" settings.json "${repo}"
done

popd
