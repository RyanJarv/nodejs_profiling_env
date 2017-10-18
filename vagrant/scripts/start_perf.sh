#!/usr/bin/env bash 

set -euo pipefail

echo "Output: file://$(pwd)/vagrant/tmp/flamegraph/out.current.svg"

vagrant ssh --command "cd /vagrant; sudo ./scripts/.guest/start_perf.sh"
