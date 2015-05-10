class Openmm < Formula
  homepage "https://simtk.org/home/openmm"

  head "https://github.com/pandegroup/openmm.git"

  url "https://github.com/pandegroup/openmm/archive/6.2.tar.gz"
  sha256 "ec2fb826cb40bb58b1ae3c2b9a099302a490398d4d26c3bc1db1393b1b6a642c"

  depends_on "cmake" => :build

  option "with-opencl", "Enable opencl library"
  option "with-test", "Verify during install with `make test`"

  def install
    mkdir "build"
    cd "build" do
      cmake_args = std_cmake_args

      if build.without? "opencl"
        cmake_args << "-DOPENMM_BUILD_OPENCL_LIB=OFF"
      end

      system "cmake", "..", *cmake_args
      system "make", "all"

      if build.with? "test"
        system "make", "test"
      end

      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
