#!/usr/bin/env bash
set -euo pipefail

BASEDIR="$(pwd)"

repos=<<-EOH
	deb http://ddebs.ubuntu.com $(lsb_release -cs) main restricted universe multiverse
	deb http://ddebs.ubuntu.com $(lsb_release -cs)-updates main restricted universe multiverse
	deb http://ddebs.ubuntu.com $(lsb_release -cs)-proposed main restricted universe multiverse" | \
	sudo tee -a /etc/apt/sources.list.d/ddebs.listecho "deb http://ddebs.ubuntu.com $(lsb_release -cs) main restricted universe multiverse
	deb http://ddebs.ubuntu.com $(lsb_release -cs)-updates main restricted universe multiverse
	deb http://ddebs.ubuntu.com $(lsb_release -cs)-proposed main restricted universe multiverse"
EOH

echo "${repos}" | sudo tee -a /etc/apt/sources.list.d/ddebs.list

apt-get install gdb
apt-get install linux-image-$(uname -r)-dbgsym
apt-get install linux-tools-$(uname -r)-generic
linux-tools-$(uname -r)-generic-dbgsym
