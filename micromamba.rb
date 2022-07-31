class Micromamba < Formula
  desc "micromamba"
  homepage "https://github.com/mamba-org/mamba"
  url "https://micro.mamba.pm/api/micromamba/osx-64/0.25.0"
  sha256 "8f9aef1988c08ed7d65d2d00c4115bea881c64adcade87e6ea26db9fa8eeff08"
  license "BSD-3-Clause"

  def install
    bin.install "bin/micromamba"
    info.install Dir["info/*"]
  end
end
