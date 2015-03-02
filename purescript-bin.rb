class PurescriptBin < Formula
  homepage "http://www.purescript.org"
  url "https://github.com/purescript/purescript/releases/download/v0.6.8/macos.tar.gz"
  sha1 "4c5e4d08bd76983a4bfd7fa8340f30e685193e49"
  version "0.6.8"

  conflicts_with "purescript"

  def install
    bin.install "psc", "psc-docs", "psc-make", "psci"
  end
end
