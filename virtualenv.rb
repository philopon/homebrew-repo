class Virtualenv < Formula
  desc "tool to create isolated Python environments"
  homepage "https://virtualenv.pypa.io"
  url "https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-15.1.0.tar.gz"
  sha256 "02f8102c2436bb03b3ee6dede1919d1dac8a427541652e5ec95171ec8adbc93a"

  depends_on :python

  def install
    system "python", *Language::Python.setup_install_args(prefix)
  end

  test do
    system "false"
  end
end
