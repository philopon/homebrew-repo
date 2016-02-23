class Mgltools < Formula
  desc "visualization and analysis of molecular structures."
  homepage "http://mgltools.scripps.edu/"
  url "http://mgltools.scripps.edu/downloads/downloads/tars/releases/REL1.5.6/mgltools_i86Darwin9_1.5.6.tar.gz"
  sha256 "15f9f64015270bfa6fa3091c7278e442a77e73d5db6d20ffe45ae019294a3d17"

  keg_only "require in package python"

  depends_on "openssl"
  depends_on :x11

  def install
    system "./install.sh", "-d", prefix
  end

  def post_install
    Dir["#{prefix}/MGLToolsPckgs/AutoDockTools/Utilities24/*.py"].each do |script|
      cnt = "#!/usr/local/opt/mgltools/bin/python\n"
      File.foreach(script) do |line|
        if /^#!/ !~ line
          cnt += line
        end
      end

      File.open(script, "w") do |file|
        file.puts(cnt)
      end
    end
  end

  test do
    system "false"
  end
end
