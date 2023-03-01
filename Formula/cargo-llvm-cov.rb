# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoLlvmCov < Formula
  desc "Cargo subcommand for LLVM source-based code coverage (-C instrument-coverage)"
  homepage "https://github.com/taiki-e/cargo-llvm-cov"
  version "0.5.11"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.11/cargo-llvm-cov-aarch64-apple-darwin.tar.gz"
      sha256 "276d8fa70299ec9ae014cab905cdbd614d6bddfa6abcc414492091585dd55ab5"
    else
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.11/cargo-llvm-cov-x86_64-apple-darwin.tar.gz"
      sha256 "fe0e54836a367697a1b475440af2e7438e56caf6e548b88faa88edc221a515f7"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.11/cargo-llvm-cov-aarch64-unknown-linux-musl.tar.gz"
      sha256 "479f51fac713151f73ee0ab5d7cb1155646cde17903dfd7c526cd51253e99a4c"
    else
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.5.11/cargo-llvm-cov-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3bd355e29b8e29d0b42f0c95ec487cd8e00ffa419ba65b83968740a641a46c1e"
    end
  end

  def install
    bin.install "cargo-llvm-cov"
  end

  test do
    system "#{bin}/cargo-llvm-cov", "llvm-cov", "--version"
  end
end
