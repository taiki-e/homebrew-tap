# SPDX-License-Identifier: Apache-2.0 OR MIT
# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoMinimalVersions < Formula
  desc "Cargo subcommand for proper use of -Z minimal-versions"
  homepage "https://github.com/taiki-e/cargo-minimal-versions"
  version "0.1.20"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.20/cargo-minimal-versions-aarch64-apple-darwin.tar.gz"
      sha256 "376c20fcf46134a3e006d7b2737521a89e75a39b032868f479755931bb3ae397"
    else
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.20/cargo-minimal-versions-x86_64-apple-darwin.tar.gz"
      sha256 "4dfce639a978a913ef374125a8721f7fb551238a861863865244b97742c936af"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.20/cargo-minimal-versions-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9810227752801c9770893613b193db780916a990fb7c8490e55f0ba8352d4d03"
    else
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.20/cargo-minimal-versions-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b6bc98e33c7a2868d8d2079fbc0bb4fab13e7b61927242acdade67901eb8a5d1"
    end
  end

  def install
    bin.install "cargo-minimal-versions"
  end

  test do
    system "#{bin}/cargo-minimal-versions", "minimal-versions", "--version"
  end
end
