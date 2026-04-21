class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.2/crankfire_darwin_amd64.tar.gz"
      sha256 "dd6234585dcbc7ba38d930c361ba6d246dd052cc158b8b1a3ea13e7e9f942fae"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.2/crankfire_darwin_arm64.tar.gz"
      sha256 "5e5438cc272b783a9ae4f12d46b14d5a04502993d6607e9d070dd1b0e3a6fdb1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.2/crankfire_linux_amd64.tar.gz"
      sha256 "235617680cf40a9c248f94223f128f25392d95006d66d5d246d23e800bdfae20"
    end
    on_arm do
      url "https://github.com/torosent/crankfire/releases/download/v0.6.2/crankfire_linux_arm64.tar.gz"
      sha256 "d8b91ffc7796a49403fc935fae71c4af47d0529d881ac61bfa24b8f29e17d690"
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
