class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.4/crankfire_darwin_amd64.tar.gz"
      sha256 "213297ab9043c4e2fd02dcbd147b4cea7bc2ae15e781a498d2a61c20e27708f8"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.4/crankfire_darwin_arm64.tar.gz"
      sha256 "80b64bd23010722eb49232a5c73ed11ee1f501785fd17429f1789fd3f27673d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.4/crankfire_linux_amd64.tar.gz"
      sha256 "7462b8c592f124d404cc89106a40c06f087f6b5906fa9004797122d70ce2cb05"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.4/crankfire_linux_arm64.tar.gz"
      sha256 "181259dbbfdadc5e08e2ef4066671b0df330a25e18a671c13f5f0c120e99db0d"
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
