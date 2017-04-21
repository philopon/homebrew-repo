class Openmm < Formula
  homepage "https://simtk.org/home/openmm"
  url "https://github.com/pandegroup/openmm/archive/7.1.tar.gz"
  sha256 "a9d73973677fd2c0ffd7072ca9951c55cf6b27f7b998f12f106ff8452fe9feb8"
  head "https://github.com/pandegroup/openmm.git"

  option "with-opencl", "Enable opencl library"

  depends_on "cmake"   => :build
  depends_on "doxygen" => :build
  depends_on "swig"    => :build
  depends_on :python3 => :recommended
  depends_on "fftw"

  def install
    Language::Python.each_python(build) do |python, version|
      python_exe = "/usr/local/bin/python#{version}"
      build_dir = "build#{version}"
      mkdir build_dir

      cd build_dir do
        cmake_args = std_cmake_args
        cmake_args << "-DPYTHON_EXECUTABLE=#{python_exe}"

        if build.without? "opencl"
          cmake_args << "-DOPENMM_BUILD_OPENCL_LIB=OFF"
        end

        system "cmake", "..", *cmake_args
        system "make", "all"
        system "make", "install"

        cd "python" do
          ENV["OPENMM_INCLUDE_PATH"] = include
          ENV["OPENMM_LIB_PATH"]     = lib
          system python_exe, "setup.py", "--no-user-cfg", "install", "--prefix=#{libexec}"
        end
      end
    end
  end

  test do
    system "false"
  end
end
