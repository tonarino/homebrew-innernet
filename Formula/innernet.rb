class Innernet < Formula
  desc "Creates private networks that use WireGuard under the hood"
  homepage "https://github.com/tonarino/innernet"
  url "https://github.com/tonarino/innernet/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "ae0d44c7b1470adcd948df7a11b0e1a9a177da4cd44e62bb8340cf8b1ae78c27"
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
