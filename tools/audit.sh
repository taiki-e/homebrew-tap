#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -euo pipefail
IFS=$'\n\t'

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR

# Audit formulas.
#
# USAGE:
#    ./tools/audit.sh

set -x

tap_name=taiki-e/test
brew tap-new --no-git "${tap_name}"
cp Formula/*.rb "$(brew --repo "${tap_name}")"/Formula

if [[ -n "${CI:-}" ]]; then
    for formula in Formula/*.rb; do
        formula="$(basename "${formula%.*}")"
        brew uninstall "${tap_name}/${formula}"
    done
fi

for formula in Formula/*.rb; do
    formula="$(basename "${formula%.*}")"
    brew audit --strict "${tap_name}/${formula}"
done

brew untap "${tap_name}"
