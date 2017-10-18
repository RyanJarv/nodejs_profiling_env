#!/usr/bin/env bash

set -euo pipefail

echo "Output: file://$(pwd)/vagrant/tmp/flamegraph/out.current.svg"

vagrant ssh --command "/vagrant/vagrant/scripts/server.sh"
vagrant ssh --command "sudo /vagrant/vagrant/scripts/flamegraph.sh"
