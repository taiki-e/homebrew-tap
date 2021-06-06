class CargoHack < Formula
  desc "Cargo subcommand for testing and continuous integration"
  homepage "https://github.com/taiki-e/cargo-hack"
  version "0.5.5"
  license any_of: ["Apache-2.0", "MIT"]
  bottle :unneeded

  if OS.mac?
    url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.5/cargo-hack-x86_64-apple-darwin.tar.gz"
    sha256 "8a802f72e7b746cbfa3988ba0a8e8a4eb3ddc0ae83d44bf7eb982588e3df2bcc"
  end
  if OS.linux?
    url "https://github.com/taiki-e/cargo-hack/releases/download/v0.5.5/cargo-hack-x86_64-unknown-linux-musl.tar.gz"
    sha256 "632f228655646f75a6fb237cd18d11b6aabf9b4814297eda65d3f354bf8c9268"
  end

  def install
    bin.install "cargo-hack"
  end

  test do
    system "#{bin}/cargo-hack", "hack", "--version"
  end
end
