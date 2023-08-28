# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoMinimalVersions < Formula
  desc "Cargo subcommand for proper use of -Z minimal-versions"
  homepage "https://github.com/taiki-e/cargo-minimal-versions"
  version "0.1.16"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.16/cargo-minimal-versions-aarch64-apple-darwin.tar.gz"
      sha256 "27090dbcb9d3046eadc7add438748fdd0795b5caddb985614f5dbcc791902b27"
    else
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.16/cargo-minimal-versions-x86_64-apple-darwin.tar.gz"
      sha256 "7b81508be9bb73cef8caa8b1b09113eebd1897356aa371246572c4fa6d4b19b9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.16/cargo-minimal-versions-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c42cba95957e6cea55800658367f59c709205d2888a0728817f15c95c6ed257f"
    else
      url "https://github.com/taiki-e/cargo-minimal-versions/releases/download/v0.1.16/cargo-minimal-versions-x86_64-unknown-linux-musl.tar.gz"
      sha256 "30dc1bc067c6ac347bd0734a3117c0519e7ae715021d56952be3e207ed918447"
    end
  end

  def install
    bin.install "cargo-minimal-versions"
  end

  test do
    system "#{bin}/cargo-minimal-versions", "minimal-versions", "--version"
  end
end
