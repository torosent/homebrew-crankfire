class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.3.0/crankfire_darwin_amd64.tar.gz"
      sha256 "f77d1066783497e102382205a8b3cfdc4d14994b2f4bd111fe463117b74912fe"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.3.0/crankfire_darwin_arm64.tar.gz"
      sha256 "7e9038118f73e89bee0ba9345367c214be4e04dc3812e785502597df71da05f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.3.0/crankfire_linux_amd64.tar.gz"
      sha256 "b786d9c6938606a5824db4250b3c987bc13610d6c8f4a7ca406fc109a1c106d7"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.3.0/crankfire_linux_arm64.tar.gz"
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
