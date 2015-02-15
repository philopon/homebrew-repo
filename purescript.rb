class Purescript < Formula
  homepage "http://www.purescript.org"
  url "https://github.com/purescript/purescript/releases/download/v0.6.7/macos.tar.gz"
  sha1 "f4734f0fde11b9572f8d7c0036d519bb8cd1860f"
  version "0.6.7"


  def install
    bin.install "psc", "psc-docs", "psc-make", "psci"
  end
end
