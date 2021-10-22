#!/bin/bash

# Update formulas.
#
# Usage:
#    ./tools/formula.sh

set -euo pipefail
IFS=$'\n\t'

OWNER="taiki-e"
PACKAGES=(
    "cargo-hack"      # https://github.com/taiki-e/cargo-hack
    "cargo-llvm-cov"  # https://github.com/taiki-e/cargo-llvm-cov
    "parse-changelog" # https://github.com/taiki-e/parse-changelog
)
DESCRIPTIONS=(
    "Cargo subcommand for testing and continuous integration"
    "Cargo subcommand for LLVM source-based code coverage (-Z instrument-coverage)"
    "Simple changelog parser, written in Rust"
)
TESTS=(
    'system "#{bin}/cargo-hack", "hack", "--version"'
    'system "#{bin}/cargo-llvm-cov", "llvm-cov", "--version"'
    'system "#{bin}/parse-changelog", "--version"'
)

cd "$(cd "$(dirname "$0")" && pwd)"/..

for i in "${!PACKAGES[@]}"; do
    package="${PACKAGES[${i}]}"
    class=$(sed -r 's/(^|-)(\w)/\U\2/g' <<<"${package}")
    set -x
    tag=$(curl -fsSL --retry 3 "https://api.github.com/repos/${OWNER}/${package}/releases/latest" | jq -r '.tag_name')
    mac_url="https://github.com/${OWNER}/${package}/releases/download/${tag}/${package}-x86_64-apple-darwin.tar.gz"
    linux_url="https://github.com/${OWNER}/${package}/releases/download/${tag}/${package}-x86_64-unknown-linux-musl.tar.gz"
    mac_sha="$(curl -fsSL --retry 3 "${mac_url}" | sha256sum)"
    linux_sha="$(curl -fsSL --retry 3 "${linux_url}" | sha256sum)"
    set +x

    out="# This file is @generated by $(basename "$0").
# It is not intended for manual editing.
class ${class} < Formula
  desc \"${DESCRIPTIONS[${i}]}\"
  homepage \"https://github.com/${OWNER}/${package}\"
  version \"${tag#v}\"
  license any_of: [\"Apache-2.0\", \"MIT\"]

  on_macos do
    if Hardware::CPU.intel?
      url \"${mac_url}\"
      sha256 \"${mac_sha%  *}\"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url \"${linux_url}\"
      sha256 \"${linux_sha%  *}\"
    end
  end

  def install
    bin.install \"${package}\"
  end

  test do
    ${TESTS[${i}]}
  end
end"
    echo "${out}" >./Formula/"${package}".rb
done
