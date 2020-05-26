class Mgltools < Formula
  desc "visualization and analysis of molecular structures."
  homepage "http://mgltools.scripps.edu/"
  url "https://ccsb.scripps.edu/download/529/"
  version "1.5.7"
  sha256 "b94755d52e76beda93bb8ef7d0ee176aeea4128104eaf55d17cae7bd1e492bbe"

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
