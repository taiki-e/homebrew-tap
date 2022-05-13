# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoLlvmCov < Formula
  desc "Cargo subcommand for LLVM source-based code coverage (-Z instrument-coverage)"
  homepage "https://github.com/taiki-e/cargo-llvm-cov"
  version "0.4.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.4.0/cargo-llvm-cov-x86_64-apple-darwin.tar.gz"
      sha256 "3107b26a32d58b518a6fd7d322451fd70364498bf9cfd1cecef1dbf806ab1ef7"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.4.0/cargo-llvm-cov-x86_64-unknown-linux-musl.tar.gz"
      sha256 "55ad6fdacbeff5e848b4bbb0dc0ea1cf855b51d30a34b08c84f0f87792ed576a"
    elsif Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.4.0/cargo-llvm-cov-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9e1248a66b71dcd792128469f8718fd07335c3f10cb81a5876eaba8fd0019187"
    end
  end

  def install
    bin.install "cargo-llvm-cov"
  end

  test do
    system "#{bin}/cargo-llvm-cov", "llvm-cov", "--version"
  end
end
