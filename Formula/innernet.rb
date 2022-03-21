class Innernet < Formula
  desc "Creates private networks that use WireGuard under the hood"
  homepage "https://github.com/tonarino/innernet"
  url "https://github.com/tonarino/innernet/archive/refs/tags/v1.5.4.tar.gz"
  sha256 "235fab9fbf67be8667ac0ec89f7fc45771b28d85be791ac3d9ae9a4d21e15673"
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
