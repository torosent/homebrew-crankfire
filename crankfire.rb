class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_darwin_amd64.tar.gz"
      sha256 "8003d326820b1b3702a18813129906604d50efa7930af0e836b6b898b062e6f1"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_darwin_arm64.tar.gz"
      sha256 "75eaa062064db0820f4a81105f861519621e4b5d7fa5fc663a9684dec807bb03"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_linux_amd64.tar.gz"
      sha256 "95a39da6709a6deb5364d33be76fff5afac4bec1b85efbf0ec9970f8f2d4a661"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_linux_arm64.tar.gz"
      sha256 "c8b82a00b28c1c2c95feae118d5d4c6af1e301612245808f1467033cd6e16cfc"
    end
  end

  def install
    bin.install "crankfire"
  end

  test do
    # Test version output
    assert_match "crankfire", shell_output("#{bin}/crankfire --help")
    
    # Test basic functionality with a simple request
    output = shell_output("#{bin}/crankfire --target https://httpbin.org/get --total 1 2>&1", 0)
    assert_match "Total Requests:", output
  end
end
