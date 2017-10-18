#!/usr/bin/env bash

set -euo pipefail

pushd vagrant

for repo in $(jq -r '.repos|keys|.[]' settings.json); do
    git clone $(jq -r ".repos.${repo}.url" settings.json) "${repo}"
done

git clone https://github.com/brendangregg/FlameGraph.git

popd
