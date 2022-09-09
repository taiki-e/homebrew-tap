# This file is @generated by formula.sh.
# It is not intended for manual editing.
class ParseChangelog < Formula
  desc "Simple changelog parser, written in Rust"
  homepage "https://github.com/taiki-e/parse-changelog"
  version "0.5.1"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.5.1/parse-changelog-aarch64-apple-darwin.tar.gz"
      sha256 "604301690c6d8a104a268a149690fdc819635fc529d0f80cab15871e6548f150"
    else
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.5.1/parse-changelog-x86_64-apple-darwin.tar.gz"
      sha256 "9fc483f5404131fc4ca68e6b200dfce3248c1eed72656b17258273090ea496fa"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.5.1/parse-changelog-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1471f2bcdb4ccff7b525335149cd0b1baddc1243c1d7c4f1a093def61e5d3a10"
    else
      url "https://github.com/taiki-e/parse-changelog/releases/download/v0.5.1/parse-changelog-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c2591b7921d548f628cb2ce59cd6c0fab1fab44dac62d98a23c75b84d2f2b935"
    end
  end

  def install
    bin.install "parse-changelog"
  end

  test do
    system "#{bin}/parse-changelog", "--version"
  end
end
