# SPDX-License-Identifier: Apache-2.0 OR MIT
# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoMinimalVersions < Formula
  desc "Cargo subcommand for proper use of -Z minimal-versions"
  homepage "https://github.com/taiki-e/cargo-minimal-versions"
  version "0.1.30"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.30/cargo-minimal-versions-aarch64-apple-darwin.tar.gz"
      sha256 "99c141466361587a6e9c5a0455245e1379ada63d7258b6a6765bc0f715a4444e"
    else
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.30/cargo-minimal-versions-x86_64-apple-darwin.tar.gz"
      sha256 "3cacfaedc52499c4a2875148ede335c504e6dadd605a726baafc76929d6f7ddc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.30/cargo-minimal-versions-aarch64-unknown-linux-musl.tar.gz"
      sha256 "60371ed27eb44193774ada646fd58608fa6441b89913268880168795d9cd0a65"
    else
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.30/cargo-minimal-versions-x86_64-unknown-linux-musl.tar.gz"
      sha256 "72a89985f39e12285b7d8e63cf26d8f41c97d72aea83478dc685d513d9e75044"
    end
  end

  def install
    bin.install "cargo-minimal-versions"
  end

  test do
    system "#{bin}/cargo-minimal-versions", "minimal-versions", "--version"
  end
end
