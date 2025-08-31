#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
cd -- "$(dirname -- "$0")"/../..

x() {
  (
    set -x
    "$@"
  )
}

if [[ -z "${CI:-}" ]]; then
  bail "this script is intended to call on CI"
fi

tap_name=taiki-e/test
formulas=()
for formula in Formula/*.rb; do
  name="${formula##*/}"
  formulas+=("${tap_name}/${name%.*}")
done

x brew tap-new --no-git "${tap_name}"
x cp -- Formula/*.rb "$(brew --repo "${tap_name}")"/Formula

for formula in "${formulas[@]}"; do
  x brew install "${formula}"
done
for formula in "${formulas[@]}"; do
  x brew test --verbose "${formula}"
done
for formula in "${formulas[@]}"; do
  x brew uninstall "${formula}"
done
# 4.6.6 has useless "Stable: `version ...` is redundant with version scanned from URL" error
if ! brew --version | grep -Fq '4.6.6'; then
  for formula in "${formulas[@]}"; do
    x brew audit --strict "${formula}"
  done
fi

x brew untap "${tap_name}"
