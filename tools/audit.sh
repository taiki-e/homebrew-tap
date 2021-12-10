#!/bin/bash
set -euxo pipefail
IFS=$'\n\t'

# Audit formulas.
#
# USAGE:
#    ./tools/audit.sh

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
