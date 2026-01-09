class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.1/crankfire_darwin_amd64.tar.gz"
      sha256 "13b24d7f3cbe3f0ff25a840282f63ae6ac65d66e3ccab4f0c102d180c2acdac5"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.1/crankfire_darwin_arm64.tar.gz"
      sha256 "6073e860771b0401daa6eddd7a529f21bb27d1dd7f8fa16e0b602d87fc1331a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.1/crankfire_linux_amd64.tar.gz"
      sha256 "cf995d7c14ba253c13d864c9ce0e51e67180743da55f6fea67d1d3ec93a7b2c6"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.1/crankfire_linux_arm64.tar.gz"
      sha256 "86d4e40d50b11ea98302c989f46577832638091581021324f90048c5a167715b"
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
