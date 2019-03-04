class Rdkit < Formula
  homepage "http://rdkit.org/"
  url "https://github.com/rdkit/rdkit/archive/Release_2018_09_2.tar.gz"
  sha256 "02d805c579797cdbe127fdcf659fb82e7ad4d3b29ecd421b995d2f87b69962d3"
  head "https://github.com/rdkit/rdkit.git", :revision => "dfae8377dd154c1106e25ad60af91b4da21b26f3"

  depends_on "cmake" => :build
  depends_on "wget" => :build
  depends_on "eigen" => :build
  depends_on "boost"
  depends_on "python"
  depends_on "boost-python3"
  depends_on "numpy"

  def install
    ENV["RD_BASE"] = buildpath

    python_executable = "#{HOMEBREW_PREFIX}/bin/python3"

    args = std_cmake_args
    args << "-DRDK_INSTALL_INTREE=OFF"
    args << "-DRDK_BUILD_INCHI_SUPPORT=OFF"
    args << "-DPYTHON_EXECUTABLE='#{python_executable}'"
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
