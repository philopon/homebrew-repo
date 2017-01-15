class PamTouchid < Formula
  desc "A PAM module for authentication with Touch ID"
  homepage "https://github.com/hamzasood/pam_touchid"
  head "https://github.com/hamzasood/pam_touchid.git"

  depends_on :xcode => :build

  def install
    system "xcodebuild"
    target = "build/Release/pam_touchid.so.2"
    chmod 0444, target
    (lib/'pam').install target
  end

  test do
    system "false"
  end
end
