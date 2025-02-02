class DfuUtil < Formula
  desc "USB programmer"
  homepage "https://dfu-util.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/dfu-util/dfu-util-0.10.tar.gz"
  sha256 "a03dc58dfc79c056819c0544b2a5970537566460102b3d82cfb038c60e619b42"
  license "GPL-2.0"

  bottle do
    sha256 cellar: :any,                 arm64_big_sur: "387d614558287e0b5b7f6911d30f0f362d37771f21e7ee11f678859c0447ecea"
    sha256 cellar: :any,                 big_sur:       "1e960a2b57fd6fa0fbfe5a9bb7aa0e35e24664ee65d686eb8fbef724152bc0d0"
    sha256 cellar: :any,                 catalina:      "3baa1c97498ad73a60b12c1d1ffa192a9b57946be6ced7ab826f3e1135113a74"
    sha256 cellar: :any,                 mojave:        "6bc199867512701a02e09aeea49adfefb5d38f413e8401b35025a827fbcc4036"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8e47e33db3f1809197dd05093a5477779fde7d1da2e7c5f83a132d2f742d1b54"
  end

  head do
    url "https://git.code.sf.net/p/dfu-util/dfu-util.git", branch: "master"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "libusb"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"dfu-util", "-V"
    system bin/"dfu-prefix", "-V"
    system bin/"dfu-suffix", "-V"
  end
end
