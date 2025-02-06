# SPDX-License-Identifier: Apache-2.0 OR MIT
# This file is @generated by formula.sh.
# It is not intended for manual editing.
class ParseChangelog < Formula
  desc "Simple changelog parser, written in Rust"
  homepage "https://github.com/taiki-e/parse-changelog"
  version "0.6.12"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.6.12/parse-changelog-aarch64-apple-darwin.tar.gz"
      sha256 "cad9f0ced004adf49f217da98a28e0a2e8aa720ad082f1a64fa9b3b507405b78"
    else
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.6.12/parse-changelog-x86_64-apple-darwin.tar.gz"
      sha256 "d88b967f24eee717a34126bd1104a8eeeb561894693d9a2e760b6cf1c0edfbc9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.6.12/parse-changelog-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6cfb4707d0b90a8cf9f2c3b4d3e161d50333f4f4d180bf1e775786eec69c7820"
    else
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.6.12/parse-changelog-x86_64-unknown-linux-musl.tar.gz"
      sha256 "619b7512735e294e9f758df6ed6d85a562d126460d71d3349d9f08e667a29225"
    end
  end

  def install
    bin.install "parse-changelog"
  end

  test do
    system "#{bin}/parse-changelog", "--version"
  end
end
