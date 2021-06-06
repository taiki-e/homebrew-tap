class ParseChangelog < Formula
  desc "Simple changelog parser, written in Rust"
  homepage "https://github.com/taiki-e/parse-changelog"
  version "0.3.0"
  license any_of: ["Apache-2.0", "MIT"]
  bottle :unneeded

  if OS.mac?
    url "https://github.com/taiki-e/parse-changelog/releases/download/v0.3.0/parse-changelog-x86_64-apple-darwin.tar.gz"
    sha256 "8d71e1ff24efeb15d15ecef8973c1dcae94879a4b125149170117a054ada624c"
  end
  if OS.linux?
    url "https://github.com/taiki-e/parse-changelog/releases/download/v0.3.0/parse-changelog-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2d9c383127227c2544ef57a9bcaff0b2db7598adc12fcdbfd6c8187cae6d52eb"
  end

  def install
    bin.install "parse-changelog"
  end

  test do
    system "#{bin}/parse-changelog", "--version"
  end
end
