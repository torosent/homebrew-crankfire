class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_darwin_amd64.tar.gz"
      sha256 "6a011d0de5906b97e8fef84568160b2e7e03190fe2c232c43d01d848cff01526"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_darwin_arm64.tar.gz"
      sha256 "242e32ce7199df6427bea7134cd543fabadb07f4dc11a19334d690722569f105"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_linux_amd64.tar.gz"
      sha256 "07e046e8aa7b6ce49871be49bd57e1cfefedde60775da637e80cf685b52b3c72"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.1/crankfire_linux_arm64.tar.gz"
      sha256 "1a62cfa0a318e3ec118be705d9a38f1191be1e52e8abc3569d454127dc84d8cb"
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
