# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoLlvmCov < Formula
  desc "Cargo subcommand for LLVM source-based code coverage (-C instrument-coverage)"
  homepage "https://github.com/taiki-e/cargo-llvm-cov"
  version "0.5.30"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.30/cargo-llvm-cov-aarch64-apple-darwin.tar.gz"
      sha256 "58d6295dffafdb920a1096635f9dd5334e5911d3e27cd7bccb0d2d9f99cc86b2"
    else
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.30/cargo-llvm-cov-x86_64-apple-darwin.tar.gz"
      sha256 "9f634e2bed2dff89ec21177daf8abc1d55c1cca07e73d52f70b796f63a7a3d52"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.30/cargo-llvm-cov-aarch64-unknown-linux-musl.tar.gz"
      sha256 "87718e164f6206fe4b2cf9b600bcafa1b582f22509820147f1060569e1d9217c"
    else
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.30/cargo-llvm-cov-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6731e8d7767145debb825095ab3ab7b9ab25cf7f5a10d22d17c1ef4566fbf249"
    end
  end

  def install
    bin.install "cargo-llvm-cov"
  end

  test do
    system "#{bin}/cargo-llvm-cov", "llvm-cov", "--version"
  end
end
