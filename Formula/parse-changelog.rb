# SPDX-License-Identifier: Apache-2.0 OR MIT
# This file is @generated by formula.sh.
# It is not intended for manual editing.
class ParseChangelog < Formula
  desc "Simple changelog parser, written in Rust"
  homepage "https://github.com/taiki-e/parse-changelog"
  version "0.6.6"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.6.6/parse-changelog-aarch64-apple-darwin.tar.gz"
      sha256 "5ee2f83a32a7373e2022d79cb637763c35a45d03601ca5505131c265d6329e9d"
    else
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.6.6/parse-changelog-x86_64-apple-darwin.tar.gz"
      sha256 "7ddd89ab37f2989e1ab61c899e17aeded29a7949412bc782c9bc30c0a00e9a26"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.6.6/parse-changelog-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ad1242a89ab72b3f36f0a5e1989510ed2ef4b286dba9f5c078bbee2078508a32"
    else
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.6.6/parse-changelog-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b69f876c15d0152ae1272a0a39568b43cec3736b6e66c3300405ae9d6fdc4760"
    end
  end

  def install
    bin.install "parse-changelog"
  end

  test do
    system "#{bin}/parse-changelog", "--version"
  end
end
