class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_darwin_amd64.tar.gz"
      sha256 "a07da9a77ccb320c8c658e2f96612e70b1d3bf2cb6929f5cb59f5aa8459d866f"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_darwin_arm64.tar.gz"
      sha256 "6917173090fe6b40cd1260486d7c9f2248d66308af861d9d5e20608d6fd4e561"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_linux_amd64.tar.gz"
      sha256 "d3b417c7d4a69be79b82af76385ab590160bcbc0e8975f8374237e5d131ebfa4"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_linux_arm64.tar.gz"
      sha256 "cc523912337098c24c44d628a2637c46ef07286baef976ac5dd1a8214eea2b89"
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
