class RdkitPython < Formula
  homepage "http://rdkit.org/"
  url "https://github.com/rdkit/rdkit/archive/Release_2015_09_2.tar.gz"
  sha256 "2ad97ec2de97729c483b89cd65470d828a4be84c88305043660cc524a86fd053"

  keg_only "multiple version"

  option "without-python3"
  option "without-python"

  depends_on "cmake" => :build
  depends_on "wget" => :build
  depends_on "boost"
  depends_on :python
  depends_on :python3
  depends_on "boost-python"
  depends_on "homebrew/python/numpy"

  def install
    cd "External/INCHI-API" do
      system "bash", "download-inchi.sh"
    end

    Language::Python.each_python(build) do |python, version|
      python = `#{python} -c "import sys; print(sys.executable)"`.chomp
      python_prefix = `#{python} -c "import sys;print(sys.prefix)"`.chomp
      python_include = `#{python} -c "from distutils import sysconfig;print(sysconfig.get_python_inc(True))"`.chomp
      site_packages = "lib/python#{version}/site-packages"
      numpy_include = `#{python} -c "import numpy;print(numpy.get_include())"`.chomp

      args = std_cmake_parameters.split
      args << "-DRDK_INSTALL_INTREE=OFF"
      args << "-DRDK_BUILD_INCHI_SUPPORT=ON"

      args << "-DPYTHON_EXECUTABLE='#{python}'"
      args << "-DPYTHON_INCLUDE_DIR='#{python_include}'"
      args << "-DPYTHON_LIBRARY='#{python_prefix}/Python'"
      args << "-DPYTHON_NUMPY_INCLUDE_PATH='#{numpy_include}'"
      args << "."

      system "cmake", *args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
