class Yaskkserv2SkkJisyoL < Formula
  desc "Yet Another SKK server"
  version "1.0.0"
  homepage "http://openlab.ring.gr.jp/skk/wiki/wiki.cgi"
  url "http://openlab.jp/skk/dic/SKK-JISYO.L.gz"
  sha256 "0f97afa1f1126de83c2222b802d323f8a295f6b8dd8e50b88986725bac2d5a02"

  depends_on "yaskkserv2"

  def yaskkserv2_jisyo
    share/"dictionary.yaskkserv2"
  end

  def install
    share.mkpath
    system "yaskkserv2_make_dictionary",
      "--dictionary-filename=#{yaskkserv2_jisyo}",
      "SKK-JISYO.L"
  end

  service do
    run [
        Formula["yaskkserv2"].opt_bin/"yaskkserv2",
        f.yaskkserv2_jisyo,
        "--no-daemonize",
        "--google-suggest",
        "--google-cache-filename=" + (Dir.home+"/.cache/yaskkserv2"),
    ]
    keep_alive true
  end
end
