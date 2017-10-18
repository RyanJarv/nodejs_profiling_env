#!/usr/bin/env bash

set -euo pipefail

cd "$( dirname "${BASH_SOURCE[0]}" )/../"
pushd io/

nohup node --perf_basic_prof server.js &

popd
