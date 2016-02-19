class Mgltools < Formula
  desc "software for visualization and analysis of molecular structures."
  homepage "http://mgltools.scripps.edu/"
  url "http://mgltools.scripps.edu/downloads/downloads/tars/releases/REL1.5.6/mgltools_i86Darwin9_1.5.6.tar.gz"
  sha256 "15f9f64015270bfa6fa3091c7278e442a77e73d5db6d20ffe45ae019294a3d17"

  keg_only "require in package python"

  depends_on :x11

  def install
    system "./install.sh", "-d", prefix
  end

  test do
    system "false"
  end
end
