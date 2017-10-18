#!/usr/bin/env bash

set -euo pipefail

cd "$( dirname "${BASH_SOURCE[0]}" )/../"

pushd vagrant

git clone ssh://git@stash.curse.us:2222/co/ember.git
git clone ssh://git@stash.curse.us:2222/co/io.git
git clone https://github.com/brendangregg/FlameGraph.git
