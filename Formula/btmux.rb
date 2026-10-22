class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.162/btmux-aarch64-apple-darwin"
      sha256 "6c75b88e699d1279317ea69218089334d0b566b648f5b16fc3e48f852683c62b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.162/btmux-aarch64-unknown-linux-gnu"
      sha256 "5d1dcf0d4515a70059edc5d62ee7c7e6a9a59ce8b41e12875f9b75a8b07dc7a8"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.162/btmux-x86_64-unknown-linux-gnu"
      sha256 "c8bb46ca8f0e583fe87ecaa561c3fd1599da514d3dc4405fa9466e64508f3d6f"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  def caveats
    <<~EOS
      A running background service keeps the old version until restarted:
        btmux restart
      If you installed it with an older btmux, re-run `btmux install` once so
      it follows future upgrades.
    EOS
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
