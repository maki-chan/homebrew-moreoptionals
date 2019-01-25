class Ffmpeg < Formula
  desc "Play, record, convert, and stream audio and video"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-4.1.tar.xz"
  sha256 "a38ec4d026efb58506a99ad5cd23d5a9793b4bf415f2c4c2e9c1bb444acd1994"
  head "https://github.com/FFmpeg/FFmpeg.git"
  
  core_names "ffmpeg"

  depends_on "nasm" => :build
  depends_on "pkg-config" => :build
  depends_on "texi2html" => :build

  depends_on "aom"
  depends_on "chromaprint"
  depends_on "fdk-aac"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "frei0r"
  depends_on "game-music-emu"
  depends_on "lame"
  depends_on "libass"
  depends_on "libbluray"
  depends_on "libbs2b"
  depends_on "libcaca"
  depends_on "libgsm"
  depends_on "libmodplug"
  depends_on "librsvg"
  depends_on "libsoxr"
  depends_on "libssh"
  depends_on "libvidstab"
  depends_on "libvmaf"
  depends_on "libvorbis"
  depends_on "libvpx"
  depends_on "opencore-amr"
  depends_on "openh264"
  depends_on "openjpeg"
  depends_on "openssl"
  depends_on "opus"
  depends_on "rtmpdump"
  depends_on "rubberband"
  depends_on "sdl2"
  depends_on "snappy"
  depends_on "speex"
  depends_on "srt"
  depends_on "tesseract"
  depends_on "theora"
  depends_on "two-lame"
  depends_on "wavpack"
  depends_on "webp"
  depends_on "x264"
  depends_on "x265"
  depends_on "xvid"
  depends_on "xz"
  depends_on "zeromq"
  depends_on "zimg"

  def install
    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --enable-pthreads
      --enable-version3
      --enable-hardcoded-tables
      --enable-avresample
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
      --enable-chromaprint
      --enable-ffplay
      --enable-frei0r
      --enable-gpl
      --enable-libaom
      --enable-libass
      --enable-libbluray
      --enable-libbs2b
      --enable-libcaca
      --enable-libfdk-aac
      --enable-libfontconfig
      --enable-libfreetype
      --enable-libgme
      --enable-libgsm
      --enable-libmodplug
      --enable-libmp3lame
      --enable-libopencore-amrnb
      --enable-libopencore-amrwb
      --enable-libopenh264
      --enable-libopenjpeg
      --enable-libopus
      --enable-librsvg
      --enable-librtmp
      --enable-librubberband
      --enable-libsnappy
      --enable-libsoxr
      --enable-libspeex
      --enable-libsrt
      --enable-libssh
      --enable-libtesseract
      --enable-libtheora
      --enable-libtwolame
      --enable-libvidstab
      --enable-libvmaf
      --enable-libvorbis
      --enable-libvpx
      --enable-libwavpack
      --enable-libwebp
      --enable-libx264
      --enable-libx265
      --enable-libxvid
      --enable-libzimg
      --enable-libzmq
      --enable-lzma
      --enable-nonfree
      --enable-opencl
      --enable-openssl
      --enable-videotoolbox
      --disable-decoder=jpeg2000
    ]
    
    args << "--extra-cflags=" + `pkg-config --cflags libopenjp2`.chomp
    
    system "./configure", *args
    system "make", "install"

    # Build and install additional FFmpeg tools
    system "make", "alltools"
    bin.install Dir["tools/*"].select { |f| File.executable? f }
  end

  test do
    # Create an example mp4 file
    mp4out = testpath/"video.mp4"
    system bin/"ffmpeg", "-filter_complex", "testsrc=rate=1:duration=1", mp4out
    assert_predicate mp4out, :exist?
  end
end
