class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.174/btmux-aarch64-apple-darwin"
      sha256 "afd27b4839c011b1ecfb4823439839dbf18d4e5fcd815f22b536af466cbdb451"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.174/btmux-aarch64-unknown-linux-gnu"
      sha256 "74359d596bd35a73e55e7a6f56b0188d8d4cd327d75cc05b9f12696ed19c4e90"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.174/btmux-x86_64-unknown-linux-gnu"
      sha256 "209f454f84ec9684b002a4a288fb00b9648c22859dda25ec6cc0b55d80d4197e"
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
