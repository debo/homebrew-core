class PhpBuild < Formula
  desc "Builds PHP so that multiple versions can be used side by side"
  homepage "https://php-build.github.io"
  url "https://github.com/php-build/php-build/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "9f3f842608ee7cb3a6a9fcf592a469151fc1e73068d1c2bd6dbd15cac379857c"
  license "MIT"
  head "https://github.com/php-build/php-build.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "autoconf"
  depends_on "openssl@3"
  depends_on "pkg-config"

  def install
    ENV["PREFIX"] = prefix
    system "./install.sh"
  end

  test do
    system "#{bin}/php-build", "--definitions"
  end
end
