# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoHack < Formula
  desc "Cargo subcommand for testing and continuous integration"
  homepage "https://github.com/taiki-e/cargo-hack"
  version "0.5.15"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.15/cargo-hack-aarch64-apple-darwin.tar.gz"
      sha256 "7c0ba9b4f9194c85dcd344affb77873ceea90aad0b3506ceb45d04528bd82926"
    else
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.15/cargo-hack-x86_64-apple-darwin.tar.gz"
      sha256 "e8c5e359fc9dc50046b88c6cf08bee876de0952a31f6e6c39ea7bfba71d08193"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.15/cargo-hack-aarch64-unknown-linux-musl.tar.gz"
      sha256 "48933088a1feb1776aa7feb35f6aca84b0593ab7602c8197b5d64274f0b4b688"
    else
      url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.15/cargo-hack-x86_64-unknown-linux-musl.tar.gz"
      sha256 "85a183ee312ecc579be266388fd203886d56704e2468d4a1c98ee1057e7289f0"
    end
  end

  def install
    bin.install "cargo-hack"
  end

  test do
    system "#{bin}/cargo-hack", "hack", "--version"
  end
end
