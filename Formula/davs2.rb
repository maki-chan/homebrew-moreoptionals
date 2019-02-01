class Davs2 < Formula
  desc "An open-source decoder of AVS2-P2/IEEE1857.4 video coding standard"
  homepage "https://github.com/pkuvcl/davs2"
  url "https://github.com/pkuvcl/davs2/archive/1.6.tar.gz"
  sha256 "de93800f016cbaf08cb40184a8069050dc625da5240a528155137052d1cf81c8"
  
  def install
    Dir.chdir("build/linux") do
      system "./configure", "--enable-shared",
                            "--prefix=#{prefix}"

      system "make", "install"
    end
  end

  test do
    # For now, I do not have a suitable idea to test the functionality
    system "true"
  end
end
