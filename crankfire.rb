class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.2/crankfire_darwin_amd64.tar.gz"
      sha256 "6cae09ad61f9f1b3b7964998e8b994b2ba67fe2a848d86acad3f945c45819670"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.2/crankfire_darwin_arm64.tar.gz"
      sha256 "6325e769d48c68a4797ba1db899c3dacf27da7c5e30c3ec8b5dac7f05687821d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.2/crankfire_linux_amd64.tar.gz"
      sha256 "6f1faa4183fc33a505d9c0da6042516a96a6967780e5b061e29447905fb32bd0"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.5.2/crankfire_linux_arm64.tar.gz"
      sha256 "67c110aeadbd07663c24aae2182d10e01f7cbdfeab89b32dc2b59a7f6d4ef046"
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
