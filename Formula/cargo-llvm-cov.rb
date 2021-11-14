# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoLlvmCov < Formula
  desc "Cargo subcommand for LLVM source-based code coverage (-Z instrument-coverage)"
  homepage "https://github.com/taiki-e/cargo-llvm-cov"
  version "0.1.11"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.1.11/cargo-llvm-cov-x86_64-apple-darwin.tar.gz"
      sha256 "0421276dcffe808a54927b0308bfe0ef1b106bf76c940cf88092b5f171439ad9"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.1.11/cargo-llvm-cov-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b262bbc7e600a251ccf937d62fdd01e59f006109c3a6518f30e17dd3b99988d7"
    end
  end

  def install
    bin.install "cargo-llvm-cov"
  end

  test do
    system "#{bin}/cargo-llvm-cov", "llvm-cov", "--version"
  end
end
