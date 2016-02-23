class Namd < Formula
  desc "high-performance simulation of large biomolecular systems"
  homepage "http://www.ks.uiuc.edu/Research/namd"
  url "http://localhost:8080/src/NAMD_2.11_MacOSX-x86_64-multicore.tar.gz"
  version "2.11"
  sha256 "ce305eeaf170d0324cb4fb109cb89c6f8067476d3e9a578af31601f72b6864b4"

  depends_on "gnu-sed"

  def install
    system "gsed", "-i.bak", "1i\#!/bin/bash", "charmrun"
    bin.install "namd2", "psfgen", "flipbinpdb", "flipdcd", "charmrun", "sortreplicas"
    share.install "lib"
    doc.install "README.txt", "announce.txt", "license.txt", "notes.txt"
  end

  test do
    system "false"
  end
end
