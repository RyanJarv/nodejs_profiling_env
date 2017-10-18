#!/usr/bin/env bash

set -euo pipefail

TMPDIR="./tmp/flamegraph"
BASEDIR="$(pwd)"

rm -rf "${TMPDIR}"
mkdir -p "${TMPDIR}"

pushd "${TMPDIR}"

sleep=10
while :; do
	perf record -F 99 -a -g -p "$(pgrep -f /usr/bin/node)" -- sleep "${sleep}"
	perf script -f > "./out.perf"


	${BASEDIR}/FlameGraph/stackcollapse-perf.pl "./out.perf" > out.folded
	${BASEDIR}/FlameGraph/flamegraph.pl "./out.folded" > out.$(date '+%s').svg
	unlink out.current.svg ||:
	ln -s out.$(date '+%s').svg out.current.svg
	find . -mmin +10 -name 'out.*.svg'

	sleep=60
done

popd
