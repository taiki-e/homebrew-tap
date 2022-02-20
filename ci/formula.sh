#!/bin/bash
set -euxo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

git config user.name "Taiki Endo"
git config user.email "te316e89@gmail.com"

for formula in Formula/*.rb; do
    git add -N "${formula}"
    if ! git diff --exit-code -- "${formula}"; then
        name="$(basename "${formula%.*}")"
        version="$(grep -E '^\s+version "' "${formula}" | sed -E 's/^\s+version "//' | sed 's/"$//')"
        git add "${formula}"
        git commit -m "Update ${name} to ${version}"
        has_update=1
    fi
done

if [[ -n "${has_update:-}" ]]; then
    echo "::set-output name=success::false"
fi
