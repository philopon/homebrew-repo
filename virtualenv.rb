class Virtualenv < Formula
  desc "tool to create isolated Python environments"
  homepage "https://virtualenv.pypa.io"
  url "https://pypi.python.org/packages/source/v/virtualenv/virtualenv-14.0.6.tar.gz"
  sha256 "1ffb6a02d8999e9c97ad8f04b1d2ba44421dfb8f8a98b54aea5c6fdfb53bc526"

  depends_on :python

  def install
    system "python", *Language::Python.setup_install_args(prefix)
  end

  test do
    system "false"
  end
end
