class PurescriptBin < Formula
  homepage "http://www.purescript.org"
  url "https://github.com/purescript/purescript/releases/download/v0.6.9.3/macos.tar.gz"
  sha1 "b1e8f4d5b33398941deeb9867cc08776d3b18671"
  version "0.6.9.3"

  conflicts_with "purescript"

  def install
    bin.install "psc", "psc-docs", "psc-make", "psci"
  end
end
