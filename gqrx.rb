class Gqrx < Formula
  desc "Open source software defined radio"
  homepage "http://gqrx.dk"
  url "https://github.com/csete/gqrx/archive/v2.11.5.tar.gz"
  sha256 "5a15d8eb863f68a8590d27ebb2f50e735e814b1651de86952a7e425a68476d9d"
  head "https://github.com/csete/gqrx.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "qt"
  depends_on "python@2"
  depends_on "gsong2014/sdr/gnuradio"
  depends_on "gsong2014/sdr/gr-osmosdr"

  def install
    mkdir "build" do
      system "cmake", "-G", "Ninja", "..", *std_cmake_args
      system "ninja"
      system "ninja", "install"
    end
  end

end