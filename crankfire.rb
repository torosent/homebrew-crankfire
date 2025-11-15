class Crankfire < Formula
  desc "Optimized command-line load testing tool for HTTP endpoints"
  homepage "https://github.com/torosent/crankfire"
  url "https://github.com/torosent/crankfire/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "" # This will be automatically updated by the release process
  license "MIT"
  head "https://github.com/torosent/crankfire.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"crankfire"), "./cmd/crankfire"
  end

  test do
    # Test version output
    assert_match "crankfire", shell_output("#{bin}/crankfire --help")
    
    # Test basic functionality with a simple request
    output = shell_output("#{bin}/crankfire --target https://httpbin.org/get --total 1 2>&1", 0)
    assert_match "Total Requests:", output
  end
end
