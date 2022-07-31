class Yaskkserv2 < Formula
  desc "Yet Another SKK server"
  homepage "https://github.com/wachikun/yaskkserv2"
  url "https://github.com/wachikun/yaskkserv2/releases/download/0.1.3/yaskkserv2-0.1.3-x86_64-apple-darwin.tar.gz"
  sha256 "a1462b8a62c0fa995840c6aa5ceb23ac42776f9d8f3eb56059ae41d647854f53"

  def install
    bin.mkpath
    bin.install "yaskkserv2"
    bin.install "yaskkserv2_make_dictionary"
  end

  test do
    system "false"
  end
end
