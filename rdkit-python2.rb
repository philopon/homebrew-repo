class RdkitPython2 < Formula
  homepage "http://rdkit.org/"
  url "https://github.com/rdkit/rdkit/archive/Release_2016_09_3.tar.gz"
  sha256 "8956d57baadd06e03e6b20266731b66e749b9ff6d6123842bb9f67f0926fb0c7"

  keg_only "multiple version"

  depends_on "cmake" => :build
  depends_on "wget" => :build
  depends_on "boost"
  depends_on :python
  depends_on "boost-python"
  depends_on "numpy"

  def install
    cd "External/INCHI-API" do
      system "bash", "download-inchi.sh"
    end

    python_executable = "#{HOMEBREW_PREFIX}/bin/python2"
    python_prefix = `#{python_executable} -c "import sys;print(sys.prefix)"`.chomp
    python_include = `#{python_executable} -c "from distutils import sysconfig;print(sysconfig.get_python_inc(True))"`.chomp

    python_version = `#{python_executable} -c "import sys; print('.'.join(map(str, sys.version_info[:2])))"`.chomp
    site_packages = "lib/python#{python_version}/site-packages"
    numpy_include = `#{python_executable} -c "import numpy;print(numpy.get_include())"`.chomp

    args = std_cmake_args
    args << "-DRDK_INSTALL_INTREE=OFF"
    args << "-DRDK_BUILD_INCHI_SUPPORT=ON"

    args << "-DPYTHON_EXECUTABLE='#{python_executable}'"
    args << "-DPYTHON_INCLUDE_DIR='#{python_include}'"
    args << "-DPYTHON_LIBRARY='#{python_prefix}/Python'"
    args << "-DPYTHON_NUMPY_INCLUDE_PATH='#{numpy_include}'"
    args << "."

    system "cmake", *args
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
