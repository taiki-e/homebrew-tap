#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Update formulas.
#
# USAGE:
#    ./tools/formula.sh

OWNER="taiki-e"
PACKAGES=(
    "cargo-hack"             # https://github.com/taiki-e/cargo-hack
    "cargo-llvm-cov"         # https://github.com/taiki-e/cargo-llvm-cov
    "cargo-minimal-versions" # https://github.com/taiki-e/cargo-minimal-versions
    "parse-changelog"        # https://github.com/taiki-e/parse-changelog
)
DESCRIPTIONS=(
    "Cargo subcommand for testing and continuous integration"
    "Cargo subcommand for LLVM source-based code coverage (-Z instrument-coverage)"
    "Cargo subcommand for proper use of -Z minimal-versions"
    "Simple changelog parser, written in Rust"
)
TESTS=(
    'system "#{bin}/cargo-hack", "hack", "--version"'
    'system "#{bin}/cargo-llvm-cov", "llvm-cov", "--version"'
    'system "#{bin}/cargo-minimal-versions", "minimal-versions", "--version"'
    'system "#{bin}/parse-changelog", "--version"'
)

cd "$(cd "$(dirname "$0")" && pwd)"/..

for i in "${!PACKAGES[@]}"; do
    package="${PACKAGES[${i}]}"
    class=$(sed -r 's/(^|-)(\w)/\U\2/g' <<<"${package}")
    set -x
    tag=$(curl --proto '=https' --tlsv1.2 -fsSL --retry 10 --retry-connrefused "https://api.github.com/repos/${OWNER}/${package}/releases/latest" | jq -r '.tag_name')
    aarch64_linux_url="https://github.com/${OWNER}/${package}/releases/download/${tag}/${package}-aarch64-unknown-linux-musl.tar.gz"
    x86_64_linux_url="https://github.com/${OWNER}/${package}/releases/download/${tag}/${package}-x86_64-unknown-linux-musl.tar.gz"
    x86_64_mac_url="https://github.com/${OWNER}/${package}/releases/download/${tag}/${package}-x86_64-apple-darwin.tar.gz"
    aarch64_linux_sha="$(curl --proto '=https' --tlsv1.2 -fsSL --retry 10 --retry-connrefused "${aarch64_linux_url}" | sha256sum)"
    x86_64_linux_sha="$(curl --proto '=https' --tlsv1.2 -fsSL --retry 10 --retry-connrefused "${x86_64_linux_url}" | sha256sum)"
    x86_64_mac_sha="$(curl --proto '=https' --tlsv1.2 -fsSL --retry 10 --retry-connrefused "${x86_64_mac_url}" | sha256sum)"
    set +x

    cat >./Formula/"${package}".rb <<EOF
# This file is @generated by $(basename "$0").
# It is not intended for manual editing.
class ${class} < Formula
  desc "${DESCRIPTIONS[${i}]}"
  homepage "https://github.com/${OWNER}/${package}"
  version "${tag#v}"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.intel?
      url "${x86_64_mac_url}"
      sha256 "${x86_64_mac_sha%  *}"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "${x86_64_linux_url}"
      sha256 "${x86_64_linux_sha%  *}"
    elsif Hardware::CPU.arm?
      url "${aarch64_linux_url}"
      sha256 "${aarch64_linux_sha%  *}"
    end
  end

  def install
    bin.install "${package}"
  end

  test do
    ${TESTS[${i}]}
  end
end
EOF
done
