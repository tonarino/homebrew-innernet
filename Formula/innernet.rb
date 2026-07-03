class Innernet < Formula
  desc "Creates private networks that use WireGuard under the hood"
  homepage "https://github.com/tonarino/innernet"
  url "https://github.com/tonarino/innernet/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "1429e8546dcafe508c2f9f94a51d65aea64c8049619fef971997ae9e0fdbc79a"
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
