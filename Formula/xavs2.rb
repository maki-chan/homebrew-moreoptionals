class Xavs2 < Formula
  desc "An open-source encoder of AVS2-P2/IEEE1857.4 video coding standard"
  homepage "https://github.com/pkuvcl/xavs2"
  url "https://github.com/pkuvcl/xavs2/archive/1.3.tar.gz"
  sha256 "28f9204dc9384336de7c6210cd3317d2d6b94ec23a4d1b6113fcbe7f00d7230b"

  def install
    Dir.chdir("build/linux") do
      system "./configure", "--enable-shared",
                            "--enable-static",
                            "--prefix=#{prefix}"

      system "make", "install"
    end
  end

  test do
    # Will not test the functionality until a suitable test case is found
    system "true"
  end
end
