# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoLlvmCov < Formula
  desc "Cargo subcommand for LLVM source-based code coverage (-C instrument-coverage)"
  homepage "https://github.com/taiki-e/cargo-llvm-cov"
  version "0.5.17"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.17/cargo-llvm-cov-aarch64-apple-darwin.tar.gz"
      sha256 "cb5d1f1c700a7e1069898714e82005417a07d5455ca93fc3278cd0e5340338e5"
    else
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.17/cargo-llvm-cov-x86_64-apple-darwin.tar.gz"
      sha256 "1f089884ad5c367015971166b8f752717eb70980241ce0125da86f4044547939"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.17/cargo-llvm-cov-aarch64-unknown-linux-musl.tar.gz"
      sha256 "83ce55e7df193d86e491e5f911a63e4123e9fe182bfd89eed273d3753208190d"
    else
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.17/cargo-llvm-cov-x86_64-unknown-linux-musl.tar.gz"
      sha256 "20b563871c1ac1a83ae5683dc97fa0a1bf15ca16407b3daf751dbf652ecbea95"
    end
  end

  def install
    bin.install "cargo-llvm-cov"
  end

  test do
    system "#{bin}/cargo-llvm-cov", "llvm-cov", "--version"
  end
end
