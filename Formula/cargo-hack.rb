# SPDX-License-Identifier: Apache-2.0 OR MIT
# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoHack < Formula
  desc "Cargo subcommand for testing and continuous integration"
  homepage "https://github.com/taiki-e/cargo-hack"
  version "0.6.19"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.6.19/cargo-hack-aarch64-apple-darwin.tar.gz"
      sha256 "5d2e027a34ab26949534e5e9a764c49130515bb4eaff7e4b1e824ace6ba10617"
    else
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.6.19/cargo-hack-x86_64-apple-darwin.tar.gz"
      sha256 "277fdb2c362fad398cc858581cf06b1d3706cbbf883005285f3794ba5aa2f1f1"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.6.19/cargo-hack-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aa24c54f97b43685979ee15f2a03b0a249cc035449a3a1955e64c61e725a9e8c"
    else
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.6.19/cargo-hack-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c96cbde6b2eed3ba5c3a62911bd729362dad11ee2363cefb79e7d8b44c034b25"
    end
  end

  def install
    bin.install "cargo-hack"
  end

  test do
    system "#{bin}/cargo-hack", "hack", "--version"
  end
end
