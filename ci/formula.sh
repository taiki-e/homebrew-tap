#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR

set -x

git config user.name "Taiki Endo"
git config user.email "te316e89@gmail.com"

for formula in Formula/*.rb; do
    git add -N "${formula}"
    if ! git diff --exit-code -- "${formula}"; then
        name="$(basename "${formula%.*}")"
        version="$(grep -E '^\s+version "' "${formula}" | sed -E 's/^\s+version "//; s/"$//')"
        git add "${formula}"
        git commit -m "Update ${name} to ${version}"
        has_update=1
    fi
done

if [[ -n "${has_update:-}" ]] && [[ -n "${GITHUB_OUTPUT:-}" ]]; then
    echo "success=false" >>"${GITHUB_OUTPUT}"
fi
