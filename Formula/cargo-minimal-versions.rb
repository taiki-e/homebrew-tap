# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoMinimalVersions < Formula
  desc "Wrapper for proper use of -Z minimal-versions"
  homepage "https://github.com/taiki-e/cargo-minimal-versions"
  version "0.1.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.0/cargo-minimal-versions-x86_64-apple-darwin.tar.gz"
      sha256 "4edcff7cbabadfd682c44fde4eef8bc097357fe206dfb1d7a64323f9cc6e7a8f"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.0/cargo-minimal-versions-x86_64-unknown-linux-musl.tar.gz"
      sha256 "19d6fa618494847093f86990ef31b8229d7d032539346c43749a05f73da46aee"
    end
  end

  def install
    bin.install "cargo-minimal-versions"
  end

  test do
    system "#{bin}/cargo-minimal-versions", "minimal-versions", "--version"
  end
end
