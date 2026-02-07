class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.3/crankfire_darwin_amd64.tar.gz"
      sha256 "0c41909f3f2dcca469c9caa60c8392805305e61ea3d2b3179f048a4505d8de03"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.3/crankfire_darwin_arm64.tar.gz"
      sha256 "f4510e958beb45e1bc03c71fa274027bc44884d9d133962f97659f54dec0cc31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.3/crankfire_linux_amd64.tar.gz"
      sha256 "d817364f8c4f11983bb746acef719e426d8b9a0d8f5f890e886e512227542b68"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.3/crankfire_linux_arm64.tar.gz"
      sha256 "458453609c6e2b2a17e689c44ee67e96bd2220cb26207fc714e1c658f8185164"
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
