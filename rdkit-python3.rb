class RdkitPython3 < Formula
  homepage "http://rdkit.org/"
  url "https://github.com/rdkit/rdkit/archive/Release_2015_09_2.tar.gz"
  sha256 "2ad97ec2de97729c483b89cd65470d828a4be84c88305043660cc524a86fd053"

  keg_only "multiple version"

  depends_on "cmake" => :build
  depends_on "wget" => :build
  depends_on "boost"
  depends_on :python3
  depends_on "boost-python" => "with-python3"
  depends_on "homebrew/python/numpy" => "with-python3"

  def install
    args = std_cmake_parameters.split
    args << "-DRDK_INSTALL_INTREE=OFF"

    cd "External/INCHI-API" do
      system "bash", "download-inchi.sh"
    end
    args << "-DRDK_BUILD_INCHI_SUPPORT=ON"

    python_executable = "#{HOMEBREW_PREFIX}/bin/python3"
    python_prefix = `#{python_executable} -c "import sys;print(sys.prefix)"`.chomp
    python_include = `#{python_executable} -c "from distutils import sysconfig;print(sysconfig.get_python_inc(True))"`.chomp

    python_version = `#{python_executable} -c "import sys; print('.'.join(map(str, sys.version_info[:2])))"`.chomp
    site_packages = "lib/python#{python_version}/site-packages"

    args << "-DPYTHON_EXECUTABLE='#{python_executable}'"
    args << "-DPYTHON_INCLUDE_DIR='#{python_include}'"
    args << "-DPYTHON_LIBRARY='#{python_prefix}/Python'"

    numpy_include = `#{python_executable} -c "import numpy;print(numpy.get_include())"`.chomp
    args << "-DPYTHON_NUMPY_INCLUDE_PATH='#{numpy_include}'"

    args << "."

    system "cmake", *args
    system "make"
    system "make", "install"

    File.open(HOMEBREW_PREFIX/site_packages/"rdkit-python3.pth", "w") do |file|
      file.puts(opt_prefix/site_packages)
    end
  end

  test do
    system "false"
  end
end
