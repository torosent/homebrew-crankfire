class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.0/crankfire_darwin_amd64.tar.gz"
      sha256 "39b55702fa6b040c0aa6a00a154e1ec5459807c050c33217d522de21a6685d2e"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.0/crankfire_darwin_arm64.tar.gz"
      sha256 "8bb1e5d87109c38727f8673ad0ea652e45c1b351ac58aec2db623410384e95cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.0/crankfire_linux_amd64.tar.gz"
      sha256 "35e8a4885930c10ed68630c99d1eac3d48a170a86d6f28b8129beacd9347f15f"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.0/crankfire_linux_arm64.tar.gz"
      sha256 "d3a9d8c1fff71115b28f478ad783eafb54e89ec3963144a23ad3594ea889e056"
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
