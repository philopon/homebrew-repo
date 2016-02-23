class AmberTools < Formula
  desc "several independently developed packages that work well by themselves, and with Amber itself."
  homepage "http://ambermd.org/"
  url "http://localhost:8080/src/AmberTools15.tar.bz2"
  version "15.6"
  sha256 "f0ed40998d0dc8ce5487aaa673827b8cf29bed2b6a09dbdec22e90236a614ec8"

  keg_only "require in package fftw"

  depends_on "gcc"
  depends_on "netcdf" => ["with-fortran", "with-cxx-compat"]
  depends_on :x11

  fails_with :clang do
    cause "ld: library not found for -lgfortran"
  end

  patch :p0 do
    url "http://ambermd.org/bugfixes/AmberTools/15.0/update.1"
    sha256 "e2f82ba057f5535e2246500e322ee5f0f5d418de716d3be3adc60c8b5c70f632"
  end

  patch :p0 do
    url "http://ambermd.org/bugfixes/AmberTools/15.0/update.2"
    sha256 "ccf151ac7bb5f28cf8ae6796f0b4a132257e519edccf61ab7cabab1def2c9f07"
  end

  patch :p0 do
    url "http://ambermd.org/bugfixes/AmberTools/15.0/update.3"
    sha256 "f33f6808a67c18c8ce0716486493a6d72b4ef87f8286eee430850ec58d1a7124"
  end

  patch :p0 do
    url "http://ambermd.org/bugfixes/AmberTools/15.0/update.4"
    sha256 "1fb41c65ee585e6f060bc4cd5fc15f110a53c9192f3a7b58c8800778adfb2f1a"
  end

  patch :p0 do
    url "http://ambermd.org/bugfixes/AmberTools/15.0/update.5"
    sha256 "9366b200658f710f9d559dde5e515e8ac0d56ea46826acb5b33832ec71bff307"
  end

  patch :p0 do
    url "http://ambermd.org/bugfixes/AmberTools/15.0/update.6"
    sha256 "6eceef76a2cf86c7e59fef5d3ced32a6cecf832fa7e2f4aeb1f3162ce709c814"
  end

  patch :DATA

  def install
    ENV["AMBERHOME"] = prefix
    mv Dir["*"], prefix

    cd prefix do
      system "./configure", "-macAccelerate", "--no-updates", "--with-netcdf", "/usr/local", "gnu"
      system "make", "install"
      system "make", "clean"
    end
  end

  test do
    system "make", "test.serial"
    system "make", "test.clean"
  end
end

__END__
diff --git a/AmberTools/src/configure2 b/AmberTools/src/configure2
--- a/AmberTools/src/configure2	2016-02-21 04:01:08.000000000 +0900
+++ b/AmberTools/src/configure2	2016-02-21 04:01:37.000000000 +0900
@@ -935,13 +935,13 @@

     flibs_arch="-lgfortran -w"
     flibsf_arch=
-    cc=gcc
+    cc=gcc-5
     cflags="-fPIC"
     ambercflags=""
-    cplusplus=g++
+    cplusplus=g++-5
     cxxflags="-fPIC"
     ambercxxflags=""
-    fc=gfortran
+    fc=gfortran-5
     if [ "$g95" = 'yes' ]; then
       fc=g95
     fi
