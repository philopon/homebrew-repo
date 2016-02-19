class AutodockVina < Formula
  desc "open-source program for doing molecular docking. "
  homepage "http://vina.scripps.edu"
  url "http://vina.scripps.edu/download/autodock_vina_1_1_2_mac.tgz"
  version "1.1.2"
  sha256 "7f5d967c4ba3e312cd0cd111440376feeb34236aa0755fd6efee67e55c28d874"

  def install
    bin.install "bin/vina"
    bin.install "bin/vina_split"
  end

  test do
    false
  end
end
