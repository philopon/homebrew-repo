class Purescript < Formula
  homepage "http://www.purescript.org"
  url "https://github.com/purescript/purescript/releases/download/v0.6.7.1/macos.tar.gz"
  sha1 "5ae15ae84d8fc8c4f2c2d8afddbc63fb523cc833"
  version "0.6.7.1"


  def install
    bin.install "psc", "psc-docs", "psc-make", "psci"
  end
end
