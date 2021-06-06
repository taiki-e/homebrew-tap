#!/bin/bash

# Update all formulas.
#
# Usage:
#    ./tools/formula.sh

set -euo pipefail
IFS=$'\n\t'

OWNER="taiki-e"
PACKAGES=(
    "cargo-hack"      # https://github.com/taiki-e/cargo-hack
    "parse-changelog" # https://github.com/taiki-e/parse-changelog
)
DESCRIPTIONS=(
    "Cargo subcommand for testing and continuous integration"
    "Simple changelog parser, written in Rust"
)
TESTS=(
    'system "#{bin}/cargo-hack", "hack", "--version"'
    'system "#{bin}/parse-changelog", "--version"'
)

cd "$(cd "$(dirname "${0}")" && pwd)"/..

for i in "${!PACKAGES[@]}"; do
    package="${PACKAGES[${i}]}"
    class=$(sed -r 's/(^|-)(\w)/\U\2/g' <<<"${package}")
    set -x
    tag=$(curl -LsSf "https://api.github.com/repos/${OWNER}/${package}/releases/latest" | jq -r '.tag_name')
    mac_url="https://github.com/${OWNER}/${package}/releases/download/${tag}/${package}-x86_64-apple-darwin.tar.gz"
    linux_url="https://github.com/${OWNER}/${package}/releases/download/${tag}/${package}-x86_64-unknown-linux-musl.tar.gz"
    mac_sha="$(curl -LsSf "$mac_url" | sha256sum)"
    linux_sha="$(curl -LsSf "$linux_url" | sha256sum)"
    set +x

    {
        echo "class ${class} < Formula"
        echo "  desc \"${DESCRIPTIONS[${i}]}\""
        echo "  homepage \"https://github.com/${OWNER}/${package}\""
        echo "  version \"${tag#v}\""
        echo "  license any_of: [\"Apache-2.0\", \"MIT\"]"
        echo "  bottle :unneeded"
        echo ""
        echo "  if OS.mac?"
        echo "    url \"${mac_url}\""
        echo "    sha256 \"${mac_sha%  *}\""
        echo "  end"
        echo "  if OS.linux?"
        echo "    url \"${linux_url}\""
        echo "    sha256 \"${linux_sha%  *}\""
        echo "  end"
        echo ""
        echo "  def install"
        echo "    bin.install \"${package}\""
        echo "  end"
        echo ""
        echo "  test do"
        echo "    ${TESTS[${i}]}"
        echo "  end"
        echo "end"
    } >./Formula/"${package}".rb
done
