# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoHack < Formula
  desc "Cargo subcommand for testing and continuous integration"
  homepage "https://github.com/taiki-e/cargo-hack"
  version "0.5.19"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.19/cargo-hack-aarch64-apple-darwin.tar.gz"
      sha256 "fa096d27cc1a1098866884537810247f756ca0f00401cf7b300b0a4e8b6ae7d9"
    else
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.19/cargo-hack-x86_64-apple-darwin.tar.gz"
      sha256 "d2a0cddf9d40185269d353446adeb6fdaad5420966ec4743545a0953e72f4b0e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.19/cargo-hack-aarch64-unknown-linux-musl.tar.gz"
      sha256 "51c3e9d4e1f31f2cdd9b3af4d6f657bc721452b9aba76640366fb4ef7541d446"
    else
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.19/cargo-hack-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c54b469fc5f57499468d3c1fe262d6a15b6829e43eb3c5070a9115bfb667a0c"
    end
  end

  def install
    bin.install "cargo-hack"
  end

  test do
    system "#{bin}/cargo-hack", "hack", "--version"
  end
end
