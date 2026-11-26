#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

log="$(mktemp)"
trap 'rm -f "$log"' EXIT

if ! make clean >"$log" 2>&1; then
    cat "$log"
    echo "BUILD FAILED during clean"
    exit 1
fi

if ! make all >>"$log" 2>&1; then
    cat "$log"
    echo "BUILD FAILED"
    exit 1
fi

cat "$log"

if grep -Eiq 'warning|error' "$log"; then
    echo "BUILD CONTAINS WARNINGS OR ERRORS"
    exit 1
fi

echo "BUILD PASSED: no warnings or errors"
