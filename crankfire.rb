class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.0.0/crankfire_darwin_amd64.tar.gz"
      sha256 "73d794535326f50cddbc5207a551bf3a276f7ad3b5ff412912406e340394564b"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.0.0/crankfire_darwin_arm64.tar.gz"
      sha256 "7e9038118f73e89bee0ba9345367c214be4e04dc3812e785502597df71da05f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.0.0/crankfire_linux_amd64.tar.gz"
      sha256 "9e8caf17bd58b41995f63cd2d988cfa5d66579ca35a7d11e91cfc5c1987da281"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.0.0/crankfire_linux_arm64.tar.gz"
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
