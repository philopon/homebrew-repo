class Yaskkserv2 < Formula
  desc "Yet Another SKK server"
  homepage "https://github.com/wachikun/yaskkserv2"
  url "https://github.com/wachikun/yaskkserv2/releases/download/0.1.5/yaskkserv2-0.1.5-x86_64-apple-darwin.tar.gz"
  sha256 "ed2b76e29e8a90ef232c8a1c75f178a8be23b8d9f1b9893bdc00832838cd6aea"

  def install
    bin.mkpath
    bin.install "yaskkserv2"
    bin.install "yaskkserv2_make_dictionary"
  end
end
