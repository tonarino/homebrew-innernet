class Innernet < Formula
  desc "Creates private networks that use WireGuard under the hood"
  homepage "https://github.com/tonarino/innernet"
  url "https://github.com/tonarino/innernet/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "728b54ea22a5c6c72933b4457944b2d4fc6ca2026bd62d86d26b8be613770c11"
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
