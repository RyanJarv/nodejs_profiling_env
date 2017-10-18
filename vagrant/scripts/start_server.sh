#!/usr/bin/env bash

set -euo pipefail

nohup vagrant ssh --command "cd /vagrant; ./scripts/.guest/start_server.sh" &
