#!/usr/bin/env bash

set -euo pipefail

SETTINGS="$(pwd)/settings.json"

pushd "$(jq -r '.run.dir' $SETTINGS)"

bash -c "$(jq -r '.run.cmd' $SETTINGS)"

popd
