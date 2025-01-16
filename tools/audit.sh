#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
cd -- "$(dirname -- "$0")"/..

# Audit formulas.
#
# USAGE:
#    ./tools/audit.sh

set -x

tap_name=taiki-e/test
brew tap-new --no-git "${tap_name}"
cp -- Formula/*.rb "$(brew --repo "${tap_name}")"/Formula

if [[ -n "${CI:-}" ]]; then
  for formula in Formula/*.rb; do
    name="${formula##*/}"
    name="${name%.*}"
    brew uninstall "${tap_name}/${name}"
  done
fi

for formula in Formula/*.rb; do
  name="${formula##*/}"
  name="${name%.*}"
  brew audit --strict "${tap_name}/${name}"
done

brew untap "${tap_name}"
