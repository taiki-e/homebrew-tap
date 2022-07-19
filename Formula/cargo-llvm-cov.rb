# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoLlvmCov < Formula
  desc "Cargo subcommand for LLVM source-based code coverage (-C instrument-coverage)"
  homepage "https://github.com/taiki-e/cargo-llvm-cov"
  version "0.4.10"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.4.10/cargo-llvm-cov-aarch64-apple-darwin.tar.gz"
      sha256 "1c224719fcbf3abe06777b41a81d05972d11a5ef95561f509a9a05d2f3d44559"
    else
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.4.10/cargo-llvm-cov-x86_64-apple-darwin.tar.gz"
      sha256 "7ad3d75c23ca34bfc43352bdf2efcda0cbd4e51d34418cf0656c41132eac6877"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.4.10/cargo-llvm-cov-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3a5422ae1cc10672f421bb72d5a613af85e17f89270ab4809da0609b4f598bc9"
    else
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.4.10/cargo-llvm-cov-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a5106d477a994b8afd40e7ebb85317b5960c19c31d548a244c46b50b3c7c3e41"
    end
  end

  def install
    bin.install "cargo-llvm-cov"
  end

  test do
    system "#{bin}/cargo-llvm-cov", "llvm-cov", "--version"
  end
end
