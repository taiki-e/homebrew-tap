#!/bin/bash
# shellcheck disable=SC2046
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# USAGE:
#    ./tools/tidy.sh
#
# NOTE: This script requires the following tools:
# - shfmt
# - prettier
# - shellcheck

if [[ "${1:-}" == "-v" ]]; then
    shift
    set -x
fi
if [[ $# -gt 0 ]]; then
    cat <<EOF
USAGE:
    $0 [-v]
EOF
    exit 1
fi

prettier=prettier
if type -P npm &>/dev/null && type -P "$(npm bin)/prettier" &>/dev/null; then
    prettier="$(npm bin)/prettier"
fi

if type -P shfmt &>/dev/null; then
    shfmt -l -w $(git ls-files '*.sh')
else
    echo >&2 "WARNING: 'shfmt' is not installed"
fi
if type -P "${prettier}" &>/dev/null; then
    "${prettier}" -l -w $(git ls-files '*.yml')
else
    echo >&2 "WARNING: 'prettier' is not installed"
fi
if type -P shellcheck &>/dev/null; then
    shellcheck $(git ls-files '*.sh')
else
    echo >&2 "WARNING: 'shellcheck' is not installed"
fi
