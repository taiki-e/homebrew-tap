# This file is @generated by formula.sh.
# It is not intended for manual editing.
class CargoNoDevDeps < Formula
  desc "Cargo subcommand for running cargo without dev-dependencies"
  homepage "https://github.com/taiki-e/cargo-no-dev-deps"
  version "0.2.6"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-no-dev-deps/releases/download/v0.2.6/cargo-no-dev-deps-aarch64-apple-darwin.tar.gz"
      sha256 "e45592ea2e8b9b1e8c00fea545543d5b62229e6159a32f1c11000c2cd680c693"
    else
      url "https://github.com/taiki-e/cargo-no-dev-deps/releases/download/v0.2.6/cargo-no-dev-deps-x86_64-apple-darwin.tar.gz"
      sha256 "412afe1fdc554ffdc155ba89e573b5c44cef8e5417440f29bf9ae4e9452bccb2"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/taiki-e/cargo-no-dev-deps/releases/download/v0.2.6/cargo-no-dev-deps-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dcb7de74155818329078f4e0693e71c684e8088bd411bd9c310d40291540b60a"
    else
      url "https://github.com/taiki-e/cargo-no-dev-deps/releases/download/v0.2.6/cargo-no-dev-deps-x86_64-unknown-linux-musl.tar.gz"
      sha256 "95a00b9a7bac659c273422f68e6bb38e9e69fc0d1c163552ba7bebcf8c4915ee"
    end
  end

  def install
    bin.install "cargo-no-dev-deps"
  end

  test do
    system "#{bin}/cargo-no-dev-deps", "no-dev-deps", "--version"
  end
end
