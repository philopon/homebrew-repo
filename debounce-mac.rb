class DebounceMac < Formula
  desc "Simple software keyboard debouncer"
  homepage "https://github.com/toothbrush/debounce-mac/"
  head "https://github.com/toothbrush/debounce-mac.git"

  def install
    system "make"
    bin.install("debounce")
  end

  test do
    system "false"
  end
end
