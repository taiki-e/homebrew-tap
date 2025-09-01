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
  formulas+=("${name%.*}")
done

x brew tap-new --no-git "${tap_name}"
x cp -- Formula/*.rb "$(brew --repo "${tap_name}")"/Formula

for formula in "${formulas[@]}"; do
  x brew install "${tap_name}/${formula}"
  if [[ "${formula}" == "cargo-"* ]]; then
    x cargo "${formula#cargo-}" --version
  else
    x "${formula}" --version
  fi
done
for formula in "${formulas[@]}"; do
  x brew test --verbose "${tap_name}/${formula}"
done
for formula in "${formulas[@]}"; do
  x brew uninstall "${tap_name}/${formula}"
done
for formula in "${formulas[@]}"; do
  x brew audit --strict "${tap_name}/${formula}"
done

x brew untap "${tap_name}"
