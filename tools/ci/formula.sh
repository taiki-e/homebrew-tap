#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -eEuo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/../..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR

bail() {
    echo >&2 "error: $*"
    exit 1
}

if [[ -z "${CI:-}" ]]; then
    bail "this script is intended to call from release workflow on CI"
fi

set -x

git config user.name "Taiki Endo"
git config user.email "te316e89@gmail.com"

for formula in Formula/*.rb; do
    git add -N "${formula}"
    if ! git diff --exit-code -- "${formula}"; then
        name=$(basename "${formula%.*}")
        version=$(grep -E '^\s+version "' "${formula}" | sed -E 's/^\s+version "//; s/"$//')
        git add "${formula}"
        git commit -m "Update ${name} to ${version}"
        has_update=1
    fi
done

if [[ -n "${has_update:-}" ]] && [[ -n "${GITHUB_OUTPUT:-}" ]]; then
    echo "success=false" >>"${GITHUB_OUTPUT}"
fi
