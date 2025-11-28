class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.0/crankfire_darwin_amd64.tar.gz"
      sha256 "7a51a7aaa9ded813d2f1ab1957612d5b025b942a862e9d35e2606d784d21b7cf"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.0/crankfire_darwin_arm64.tar.gz"
      sha256 "7e9038118f73e89bee0ba9345367c214be4e04dc3812e785502597df71da05f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.0/crankfire_linux_amd64.tar.gz"
      sha256 "08d0f35e1dc1c355343c7c35658a291a6a971ad1aed2cd9aec32aab02e915a10"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.0/crankfire_linux_arm64.tar.gz"
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
