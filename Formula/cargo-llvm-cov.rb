# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoLlvmCov < Formula
  desc "Cargo subcommand for LLVM source-based code coverage (-Z instrument-coverage)"
  homepage "https://github.com/taiki-e/cargo-llvm-cov"
  version "0.1.7"
  license any_of: ["Apache-2.0", "MIT"]
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.1.7/cargo-llvm-cov-x86_64-apple-darwin.tar.gz"
      sha256 "61d36ffa6e06b77774c9deb57196ea9f53620176cb2597e019e8bccddd58f460"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/taiki-e/cargo-llvm-cov/releases/download/v0.1.7/cargo-llvm-cov-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3d8d830e0a19b2e9229fff690dc803d1d442dcf4831b52294bb02bde0dce2e3f"
    end
  end

  def install
    bin.install "cargo-llvm-cov"
  end

  test do
    system "#{bin}/cargo-llvm-cov", "llvm-cov", "--version"
  end
end
