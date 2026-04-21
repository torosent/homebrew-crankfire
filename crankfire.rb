class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_darwin_amd64.tar.gz"
      sha256 "25a4b2b4f5e7910cf2b8adcd0722b42c4b9f27bf50399f55b22c6d3af3efcd1b"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_darwin_arm64.tar.gz"
      sha256 "cff617d999c73536112c8d4ac4f73ccae89d8f9efd3add90b82181ee2516ddc5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_linux_amd64.tar.gz"
      sha256 "15540eeb9746d3f482488525c50c83d93ef8298dc7b0e5e2d081d23983aa8127"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_linux_arm64.tar.gz"
      sha256 "b35b1e7dafe893c29fecd9eb4950cca16f0dd8f175b81d3e4a09adadbdb14c78"
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
