class Ambertools < Formula
  desc "ambertools"
  url "file:///dev/null"
  homepage "https://ambermd.org/index.php"
  version "22.0"
  keg_only "conda"

  depends_on "micromamba" => :build

  def install
    prefix.rmdir
    system "micromamba", "create", "-y", "-p", prefix, "-c", "conda-forge", "ambertools=#{version}", "compilers"
  end
end
