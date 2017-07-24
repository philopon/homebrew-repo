class SudoTouchid < Formula
  desc " A fork of `sudo` with Touch ID support. "
  homepage "https://github.com/mattrajca/sudo-touchid"
  head "https://github.com/mattrajca/sudo-touchid.git"

  depends_on :xcode => :build

  def install
    system "xcodebuild"
    target = "build/Release/sudo"
    bin.install target
  end

  def caveats
    installed = bin/"sudo"
    s = <<-EOS.undent
      Run these commands first:
        /usr/bin/sudo chown root:wheel $(realpath #{installed})
        /usr/bin/sudo chmod 4755 $(realpath #{installed})
    EOS
    s
  end

  test do
    system "false"
  end
end
