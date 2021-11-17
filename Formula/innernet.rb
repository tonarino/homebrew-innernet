class Innernet < Formula
  desc "Creates private networks that use WireGuard under the hood"
  homepage "https://github.com/tonarino/innernet"
  url "https://github.com/tonarino/innernet/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "56ce88db4acf3f500b084d629304aa338977865f292a75a40c7a8a83c2276fe3"
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

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>KeepAlive</key>
          <true/>
          <key>RunAtLoad</key>
          <true/>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/innernet</string>
            <string>up</string>
            <string>--daemon</string>
            <string>--interval</string>
            <string>60</string>
          </array>
          <key>UserName</key>
          <string>root</string>
          <key>LaunchOnlyOnce</key>
          <true/>
          <key>StandardOutPath</key>
          <string>/dev/null</string>
          <key>StandardErrorPath</key>
          <string>/dev/null</string>
        </dict>
      </plist>
    EOS
  end
  test do
    # TODO(jake): add tests.
    system "true"
  end
end
