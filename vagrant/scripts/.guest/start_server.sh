#!/usr/bin/env bash

set -euo pipefail

pushd io/

node --perf_basic_prof server.js

popd
