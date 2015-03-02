class CabalInstallBin < Formula
  homepage "https://www.haskell.org/cabal/"
  url "https://www.haskell.org/cabal/release/cabal-install-1.22.0.0/cabal-1.22.0.0-x86_64-apple-darwin-mavericks.tar.gz"
  sha1 "f290db731fec9679f60228bc77cb1a9693d0719a"

  def install
    bin.install "cabal"
  end
end
