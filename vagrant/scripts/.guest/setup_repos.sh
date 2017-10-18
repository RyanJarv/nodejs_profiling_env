#!/usr/bin/env bash

set -euo pipefail

pushd ember
npm i
#npm wp-prod
popd

pushd io
npm i
#npm wp-prod
popd
