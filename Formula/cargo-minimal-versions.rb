# SPDX-License-Identifier: Apache-2.0 OR MIT
# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoMinimalVersions < Formula
  desc "Cargo subcommand for proper use of -Z minimal-versions"
  homepage "https://github.com/taiki-e/cargo-minimal-versions"
  version "0.1.22"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.22/cargo-minimal-versions-aarch64-apple-darwin.tar.gz"
      sha256 "ca6309a4137229490e885e761d012b03a6aec1b9cc05b97f62f4a21aefb57535"
    else
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.22/cargo-minimal-versions-x86_64-apple-darwin.tar.gz"
      sha256 "9937c3fc4f8354561a816080da117b948e98571d480bf28eea7ee86513a7e337"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.22/cargo-minimal-versions-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7ff801179220876cd5e34f21acc45d6edb3c3a992b9c10718f93522dc5ae9462"
    else
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.22/cargo-minimal-versions-x86_64-unknown-linux-musl.tar.gz"
      sha256 "87ea60d0e93e239688f23585d238d351702dc0fbe9d3376e460f381aafe95549"
    end
  end

  def install
    bin.install "cargo-minimal-versions"
  end

  test do
    system "#{bin}/cargo-minimal-versions", "minimal-versions", "--version"
  end
end
