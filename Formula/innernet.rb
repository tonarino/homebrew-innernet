class Innernet < Formula
  desc "Creates private networks that use WireGuard under the hood"
  homepage "https://github.com/tonarino/innernet"
  url "https://github.com/tonarino/innernet/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "aed18003c3bbdf621ef204acbf6b939a18ec4943dd219be328b2400d77cddb47"
  license "MIT"
  head "https://github.com/tonarino/innernet.git", { branch: "main" }

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build
  depends_on "wireguard-go"
  uses_from_macos "llvm"

  def install
    cd "client" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    cd "client" do
      system "cargo", "test", *std_cargo_args
    end
  end
end
