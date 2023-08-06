# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoHack < Formula
  desc "Cargo subcommand for testing and continuous integration"
  homepage "https://github.com/taiki-e/cargo-hack"
  version "0.5.29"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.29/cargo-hack-aarch64-apple-darwin.tar.gz"
      sha256 "3a024f71643a0cb137b28c7da9530c417f2c64dfa5f78d5e615b7f7376b43558"
    else
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.29/cargo-hack-x86_64-apple-darwin.tar.gz"
      sha256 "1388d51e994673f30380f709f3a8bacbc7f2981c3b294f34945b9612977ae6dd"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.29/cargo-hack-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e8729bd85be2c4efc3c72c8a7c995758f4b531334144cb7376557d44492c102e"
    else
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.29/cargo-hack-x86_64-unknown-linux-musl.tar.gz"
      sha256 "97be81fba9a94970d9984ea6a02028d9c6a83d53071456aa7c7cf35b9a150405"
    end
  end

  def install
    bin.install "cargo-hack"
  end

  test do
    system "#{bin}/cargo-hack", "hack", "--version"
  end
end
