class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.2.0/crankfire_darwin_amd64.tar.gz"
      sha256 "d60e12fc017aec316065cb9e776831a83ac8994847e4e4ea2e6adb52c949157f"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.2.0/crankfire_darwin_arm64.tar.gz"
      sha256 "7e9038118f73e89bee0ba9345367c214be4e04dc3812e785502597df71da05f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.2.0/crankfire_linux_amd64.tar.gz"
      sha256 "f91fb954aa1734c3f385e2d98a181f1a7159a8b00fd4674334cec453a271214a"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.2.0/crankfire_linux_arm64.tar.gz"
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
