class Innernet < Formula
  desc "Creates private networks that use WireGuard under the hood"
  homepage "https://github.com/tonarino/innernet"
  url "https://github.com/tonarino/innernet/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "91224f51befa190c775ed7bcbbb083cec83d281c3c5c2cef5928213b19bf0440"
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
    bin.install_symlink "innernet" => "inn"
  end

  test do
    # TODO(jake): add tests.
    system "true"
  end
end
