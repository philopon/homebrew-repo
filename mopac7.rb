class Mopac7 < Formula
  desc "mopac7"
  homepage "http://openmopac.net/"
  url "http://bioinformatics.org/ghemical/download/current/mopac7-1.15.tar.gz"
  sha256 "6d7ac5d78522db70f7794fd816cea32829cfa9e93774202fe80ba5a54375fbaa"
  depends_on "libtool" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "gcc" => :build

  def install
    system "sed", "-i.bak", "s/libtoolize/glibtoolize/", "autogen.sh"
    system "sed", "-i.bak", "s#./fortran/mopac7#mopac7#", "run_mopac7"

    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make", "install"

    bin.install "fortran/mopac7"
    (bin/".libs").install "fortran/.libs/mopac7"
    bin.install "run_mopac7"
  end

  test do
    system "false"
  end
end
