class Rdkit < Formula
  homepage "http://rdkit.org/"
  url "https://github.com/rdkit/rdkit/archive/Release_2017_09_1.tar.gz"
  sha256 "6a6718896452cc55b84db6f59e95c6a91cc4091b2cda9960b74542363524808b"

  depends_on "cmake" => :build
  depends_on "wget" => :build
  depends_on "eigen" => :build
  depends_on "boost"
  depends_on :python3
  depends_on "boost-python" => "with-python3"
  depends_on "numpy" => "with-python3"

  patch :p1, :DATA

  def install
    cd "External/INCHI-API" do
      system "bash", "download-inchi.sh"
    end

    ENV["RD_BASE"] = buildpath

    python_executable = "#{HOMEBREW_PREFIX}/bin/python3"
    python_prefix = `#{python_executable} -c "import sys;print(sys.prefix)"`.chomp
    python_include = `#{python_executable} -c "from distutils import sysconfig;print(sysconfig.get_python_inc(True))"`.chomp

    numpy_include = `#{python_executable} -c "import numpy;print(numpy.get_include())"`.chomp

    args = std_cmake_args
    args << "-DRDK_INSTALL_INTREE=OFF"
    args << "-DRDK_BUILD_INCHI_SUPPORT=ON"

    args << "-DPYTHON_EXECUTABLE='#{python_executable}'"
    args << "-DPYTHON_INCLUDE_DIR='#{python_include}'"
    args << "-DPYTHON_LIBRARY='#{python_prefix}/Python'"
    args << "-DPYTHON_NUMPY_INCLUDE_PATH='#{numpy_include}'"
    args << ".."

    mkdir "build" do
      system "cmake", *args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end

__END__
diff -ur a/Code/DataManip/MetricMatrixCalc/Wrap/rdMetricMatrixCalc.cpp b/Code/DataManip/MetricMatrixCalc/Wrap/rdMetricMatrixCalc.cpp
--- a/Code/DataManip/MetricMatrixCalc/Wrap/rdMetricMatrixCalc.cpp	2017-11-15 01:54:59.334368215 +0900
+++ b/Code/DataManip/MetricMatrixCalc/Wrap/rdMetricMatrixCalc.cpp	2017-11-15 01:54:24.624859227 +0900
@@ -10,7 +10,7 @@
 //
 #define PY_ARRAY_UNIQUE_SYMBOL rdmetric_array_API
 #include <RDBoost/python.h>
-#include <boost/python/numeric.hpp>
+#include <boost/python/numpy.hpp>
 
 #include <RDBoost/PySequenceHolder.h>
 #include <RDBoost/Wrap.h>
diff -ur a/Code/DataStructs/Wrap/DataStructs.cpp b/Code/DataStructs/Wrap/DataStructs.cpp
--- a/Code/DataStructs/Wrap/DataStructs.cpp	2017-11-15 01:55:25.077337468 +0900
+++ b/Code/DataStructs/Wrap/DataStructs.cpp	2017-11-15 01:54:16.998300467 +0900
@@ -17,7 +17,7 @@
 #include <DataStructs/SparseIntVect.h>
 
 #include "DataStructs.h"
-#include <boost/python/numeric.hpp>
+#include <boost/python/numpy.hpp>
 #include <numpy/npy_common.h>
 #include <RDBoost/import_array.h>
 #include <RDBoost/pyint_api.h>
diff -ur a/Code/Demos/boost/numpy/linalg.cpp b/Code/Demos/boost/numpy/linalg.cpp
--- a/Code/Demos/boost/numpy/linalg.cpp	2017-11-15 01:56:59.556001919 +0900
+++ b/Code/Demos/boost/numpy/linalg.cpp	2017-11-15 01:54:24.198198597 +0900
@@ -3,7 +3,7 @@
 //
 
 #include <boost/python.hpp>
-#include <boost/python/numeric.hpp>
+#include <boost/python/numpy.hpp>
 #define PY_ARRAY_UNIQUE_SYMBOL RD_array_API
 #include <numpy/arrayobject.h>
 
diff -ur a/Code/GraphMol/MolAlign/Wrap/rdMolAlign.cpp b/Code/GraphMol/MolAlign/Wrap/rdMolAlign.cpp
--- a/Code/GraphMol/MolAlign/Wrap/rdMolAlign.cpp	2017-11-15 01:55:43.100415951 +0900
+++ b/Code/GraphMol/MolAlign/Wrap/rdMolAlign.cpp	2017-11-15 01:54:21.534902945 +0900
@@ -13,7 +13,7 @@
 #define PY_ARRAY_UNIQUE_SYMBOL rdmolalign_array_API
 #include <RDBoost/python.h>
 #include <RDBoost/import_array.h>
-#include <boost/python/numeric.hpp>
+#include <boost/python/numpy.hpp>
 #include "numpy/arrayobject.h"
 #include <GraphMol/MolAlign/AlignMolecules.h>
 #include <GraphMol/MolAlign/O3AAlignMolecules.h>
diff -ur a/Code/GraphMol/ReducedGraphs/Wrap/rdReducedGraphs.cpp b/Code/GraphMol/ReducedGraphs/Wrap/rdReducedGraphs.cpp
--- a/Code/GraphMol/ReducedGraphs/Wrap/rdReducedGraphs.cpp	2017-11-15 01:55:55.326909753 +0900
+++ b/Code/GraphMol/ReducedGraphs/Wrap/rdReducedGraphs.cpp	2017-11-15 01:54:22.351558057 +0900
@@ -11,7 +11,7 @@
 
 #define PY_ARRAY_UNIQUE_SYMBOL rdreducedgraphs_array_API
 #include <RDBoost/python.h>
-#include <boost/python/numeric.hpp>
+#include <boost/python/numpy.hpp>
 
 #include <RDBoost/Wrap.h>
 #include <GraphMol/GraphMol.h>
diff -ur a/Code/Numerics/Alignment/Wrap/rdAlignment.cpp b/Code/Numerics/Alignment/Wrap/rdAlignment.cpp
--- a/Code/Numerics/Alignment/Wrap/rdAlignment.cpp	2017-11-15 01:56:10.710025615 +0900
+++ b/Code/Numerics/Alignment/Wrap/rdAlignment.cpp	2017-11-15 01:54:18.864940722 +0900
@@ -10,7 +10,7 @@
 //
 #define PY_ARRAY_UNIQUE_SYMBOL rdalignment_array_API
 #include <RDBoost/python.h>
-#include <boost/python/numeric.hpp>
+#include <boost/python/numpy.hpp>
 #include <RDBoost/import_array.h>
 
 #include <RDBoost/PySequenceHolder.h>
diff -ur a/Code/SimDivPickers/Wrap/HierarchicalClusterPicker.cpp b/Code/SimDivPickers/Wrap/HierarchicalClusterPicker.cpp
--- a/Code/SimDivPickers/Wrap/HierarchicalClusterPicker.cpp	2017-11-15 01:56:24.919824754 +0900
+++ b/Code/SimDivPickers/Wrap/HierarchicalClusterPicker.cpp	2017-11-15 01:54:18.998272169 +0900
@@ -12,7 +12,7 @@
 #define PY_ARRAY_UNIQUE_SYMBOL rdpicker_array_API
 #include <RDBoost/python.h>
 
-#include <boost/python/numeric.hpp>
+#include <boost/python/numpy.hpp>
 #define NPY_NO_DEPRECATED_API NPY_1_7_API_VERSION
 #include <numpy/arrayobject.h>
 #include <RDBoost/Wrap.h>
diff -ur a/Code/SimDivPickers/Wrap/MaxMinPicker.cpp b/Code/SimDivPickers/Wrap/MaxMinPicker.cpp
--- a/Code/SimDivPickers/Wrap/MaxMinPicker.cpp	2017-11-15 01:56:37.449647657 +0900
+++ b/Code/SimDivPickers/Wrap/MaxMinPicker.cpp	2017-11-15 01:54:19.001605455 +0900
@@ -11,7 +11,7 @@
 #define PY_ARRAY_UNIQUE_SYMBOL rdpicker_array_API
 #include <RDBoost/python.h>
 #include <RDBoost/Wrap.h>
-#include <boost/python/numeric.hpp>
+#include <boost/python/numpy.hpp>
 #define NPY_NO_DEPRECATED_API NPY_1_7_API_VERSION
 #include <numpy/arrayobject.h>
 #include <map>
