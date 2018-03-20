class Rdkit < Formula
  homepage "http://rdkit.org/"
  url "https://github.com/rdkit/rdkit/archive/Release_2017_09_2.tar.gz"
  sha256 "20b4d18bdeb457c95386bd2f6efad64321cb7f1dd885c0e630845933d1276a83"

  depends_on "cmake" => :build
  depends_on "wget" => :build
  depends_on "eigen" => :build
  depends_on "boost"
  depends_on "python"
  depends_on "boost-python"
  depends_on "numpy"

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
