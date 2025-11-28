class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.0/crankfire_darwin_amd64.tar.gz"
      sha256 "3ca22b2386c3d504e35e3051846f8e19d2457a8fe759f0959888b98372e8c638"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.0/crankfire_darwin_arm64.tar.gz"
      sha256 "011e0ba798e08bfc3440fd203c52060dc65753adec7591b041f820ec6c90838f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.0/crankfire_linux_amd64.tar.gz"
      sha256 "ec6757c35e467b95a7d5dfe11afc97ff716b7bfd4629172ef2c065e41cf2189a"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.0/crankfire_linux_arm64.tar.gz"
      sha256 "9bc3169e14d8306080a12b92b84a0a2e8aa361d2eb638b0d921fb69bf8ba279b"
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
