class Ambertools < Formula
  desc ""
  homepage ""
  url "http://ambermd.org/cgi-bin/AmberTools18-binary-get.pl?Name=bot&Institution=NA&City=NA&State=NA&Country=NA&OS=osx-64"
  version "18"
  sha256 "5384b5a704e432fa0569d277a48659a385e7b0109c8291c40f114528e1cbff35"

  patch :DATA

  def install
    prefix.install Dir["*"]
  end

  test do
    system "false"
  end
end

__END__
diff -u amber18.orig/amber.sh amber18/amber.sh
--- a/amber.sh	2018-09-28 12:24:30.000000000 +0900
+++ b/amber.sh	2018-09-28 12:52:30.000000000 +0900
@@ -1,7 +1,7 @@
 # get directory of myself (amber.sh) and assume this dir is AMBERHOME
 # Aim: We can copy amber tree to the new directory without updating amber.sh
 
-AMBER_PREFIX="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
+AMBER_PREFIX=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
 export AMBERHOME=$AMBER_PREFIX
 
 echo "AMBERHOME = $AMBERHOME"
Common subdirectories: amber18.orig/bin and amber18/bin
Common subdirectories: amber18.orig/dat and amber18/dat
Common subdirectories: amber18.orig/include and amber18/include
Common subdirectories: amber18.orig/info and amber18/info
Common subdirectories: amber18.orig/lib and amber18/lib

