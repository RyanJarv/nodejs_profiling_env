#!/usr/bin/env bash

set -euo pipefail

pushd vagrant

git clone ssh://git@stash.curse.us:2222/co/ember.git
git clone ssh://git@stash.curse.us:2222/co/io.git
git clone https://github.com/brendangregg/FlameGraph.git

popd
