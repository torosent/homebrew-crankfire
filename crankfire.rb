class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.4.2/crankfire_darwin_amd64.tar.gz"
      sha256 "1025fa3d5a07fc2c6a04fae24a35920a8886e78f079140cac40c813e53332e0b"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.4.2/crankfire_darwin_arm64.tar.gz"
      sha256 "7e9038118f73e89bee0ba9345367c214be4e04dc3812e785502597df71da05f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.4.2/crankfire_linux_amd64.tar.gz"
      sha256 "f96af5cc0aa8c11d7854f234d796c5c34c274f6557c323f2e52de8607a2dccab"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.4.2/crankfire_linux_arm64.tar.gz"
      sha256 "da6b93d104af19d9ddee1496aa697d1a43e6f29c3d18ec7e10d633746832126d"
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
