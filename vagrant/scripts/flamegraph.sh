#!/usr/bin/env bash

set -euo pipefail

cd "$( dirname "${BASH_SOURCE[0]}" )/../"

TMPDIR="./tmp/flamegraph"
BASEDIR="$(pwd)"

rm -rf "${TMPDIR}"
mkdir -p "${TMPDIR}"

pushd "${TMPDIR}"

sleep=10
while :; do
	perf record -F 99 -a -g -- sleep "${sleep}"
	sleep=60
	perf script -f > "./out.perf"


	${BASEDIR}/FlameGraph/stackcollapse-perf.pl "./out.perf" > out.folded
	${BASEDIR}/FlameGraph/flamegraph.pl "./out.folded" > out.$(date '+%s').svg
	unlink out.current.svg ||:
	ln -s out.$(date '+%s').svg out.current.svg
	find . -mmin +10 -name 'out.*.svg'
done

popd
