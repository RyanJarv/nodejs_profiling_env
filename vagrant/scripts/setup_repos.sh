#!/usr/bin/env bash

set -euo pipefail

vagrant ssh --command "cd /vagrant; bash ./scripts/.guest/setup_repos.sh"
