class Autodock < Formula
  desc "suite of automated docking tools"
  homepage "http://autodock.scripps.edu/"
  url "http://autodock.scripps.edu/downloads/autodock-registration/tars/dist426/autodocksuite-4.2.6-MacOSX.tar"
  sha256 "016c5a87c3837e61229a1c800c347588dc72dc0a71c43d0a77b0dae11209000e"

  def install
    bin.install "autodock4"
    bin.install "autogrid4"
  end

  test do
    system "false"
  end
end
