class Adfr < Formula
  desc "AutodockFR suite"
  homepage "https://ccsb.scripps.edu/adfr/"
  url "https://ccsb.scripps.edu/adfr/download/1033/"
  sha256 "9556680809c76859b159b7709fa1a6e84716e2cb41a0ab8bd72aecbb7960b413"
  version "1.0rc1"
  license ""
  keg_only "conflict with open-babel"

  patch :p1, :DATA

  def install
    system "./install.sh", "-d", prefix
  end
end

__END__
--- a/install.sh	2022-07-14 15:49:58.000000000 +0900
+++ b/install.sh	2022-07-14 15:51:00.000000000 +0900
@@ -90,16 +90,18 @@
 export PYTHONHOME="$ADS_ROOT"
 if [ "`uname -s`" = "Linux" ] ; then
     export LD_LIBRARY_PATH="$ADS_ROOT/lib"
+elif [ "`uname -s`" = "Darwin" ] ; then
+    xattr -dr com.apple.quarantine $PYTHON $ADS_ROOT/lib/python2.7/lib-dynload/*
 fi
 
 ## run python script - install.py - to install the packages and create scripts
 
 if [ "$pyoptimize" -eq 1 ]; then
     echo "Running $PYTHON -O Tools/install.py $pythonargs"
-    $PYTHON -O Tools/install.py $pythonargs
+    yes | $PYTHON -O Tools/install.py $pythonargs
 else
     echo "Running $PYTHON Tools/install.py $pythonargs"
-    $PYTHON Tools/install.py  $pythonargs
+    yes | $PYTHON Tools/install.py  $pythonargs
 fi
 
 unset PYTHONHOME
