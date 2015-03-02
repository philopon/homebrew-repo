class GhcBin < Formula
  homepage "https://www.haskell.org/ghc"
  url "https://www.haskell.org/ghc/dist/7.8.3/ghc-7.8.3-x86_64-apple-darwin.tar.xz"
  sha1 "d55a671482614cbd3c12e4594437aedfd78f47de"

  env :std

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
