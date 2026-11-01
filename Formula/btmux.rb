class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.179/btmux-aarch64-apple-darwin"
      sha256 "6d1715a157b0a160051b555107465024575845977722d65e645988b2c944992f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.179/btmux-aarch64-unknown-linux-gnu"
      sha256 "e87cc081316503bce69df127811cca3bf25d0b05af187090f35d2c484cab9a61"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.179/btmux-x86_64-unknown-linux-gnu"
      sha256 "9b94e4d1addb81a2787ffafc7ce2b4dcbabefb17a7b9c4df9796f6b545835de3"
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
