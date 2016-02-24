class Pipsi < Formula
  desc " pip script installer"
  homepage "https://github.com/mitsuhiko/pipsi"
  url "https://github.com/mitsuhiko/pipsi.git", :tag => "0.9", :revision => "6f78a94269f8a0f3cca9363672e4fb327711fc14"

  depends_on :python

  resource "click" do
    url "https://pypi.python.org/packages/source/c/click/click-6.3.tar.gz"
    sha256 "b720d9faabe193287b71e3c26082b0f249501288e153b7e7cfce3bb87ac8cc1c"
  end

  def install
    resource("click").stage do
      system "python", *Language::Python.setup_install_args(prefix)
    end
    system "python", *Language::Python.setup_install_args(prefix)
  end

  test do
    system "false"
  end
end
