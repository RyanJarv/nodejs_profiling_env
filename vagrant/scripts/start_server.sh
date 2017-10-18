#!/usr/bin/env bash

set -euo pipefail

vagrant ssh --command "cd /vagrant; ./scripts/.guest/start_server.sh"
