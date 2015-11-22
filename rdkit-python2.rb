class RdkitPython2 < Formula
  homepage 'http://rdkit.org/'
  url "https://github.com/rdkit/rdkit/archive/Release_2015_09_2.tar.gz"
  version "2015.09.2"
  sha256 "2ad97ec2de97729c483b89cd65470d828a4be84c88305043660cc524a86fd053"

  depends_on "cmake" => :build
  depends_on 'wget' => :build
  depends_on 'boost'
  depends_on :python
  depends_on "boost-python"

  keg_only "multiple version"

  def install
    args = std_cmake_parameters.split
    args << '-DRDK_INSTALL_INTREE=OFF'

    system "cd External/INCHI-API; bash download-inchi.sh"
    args << '-DRDK_BUILD_INCHI_SUPPORT=ON'

    python_executable = "#{HOMEBREW_PREFIX}/bin/python2"
    python_prefix = %x(#{python_executable} -c 'import sys;print(sys.prefix)').chomp
    python_include = %x(#{python_executable} -c 'from distutils import sysconfig;print(sysconfig.get_python_inc(True))').chomp
    python_version = %x(#{python_executable} -c 'import sys;print(sys.version[:3])').chomp
    args << "-DPYTHON_EXECUTABLE='#{python_executable}'"
    args << "-DPYTHON_INCLUDE_DIR='#{python_include}'"
    args << "-DPYTHON_LIBRARY='#{python_prefix}/Python'"

    numpy_include = %x(#{python_executable} -c 'import numpy;print(numpy.get_include())').chomp
    args << "-DPYTHON_NUMPY_INCLUDE_PATH='#{numpy_include}'"

    args << '.'

    system "cmake", *args
    system "make"
    system "make install"
  end
end
