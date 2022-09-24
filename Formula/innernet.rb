class Innernet < Formula
  desc "Creates private networks that use WireGuard under the hood"
  homepage "https://github.com/tonarino/innernet"
  url "https://github.com/tonarino/innernet/archive/refs/tags/v1.5.5.tar.gz"
  sha256 "b4b7f89658b3c8b77d6482e7a7d21362037fb1f332b9db53bebda6fd8f6b91ad"
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
