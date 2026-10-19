class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.155/btmux-aarch64-apple-darwin"
      sha256 "693aa8f83cf7dccad7de0d5d740c1a3a597b518e3095592b5d5febf299832137"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.155/btmux-aarch64-unknown-linux-gnu"
      sha256 "d100f7156567cde8818e636c3175934fc72361fafa996fdaf5cd1e9f353f8f3a"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.155/btmux-x86_64-unknown-linux-gnu"
      sha256 "49b18424a222ea55c5f2eda4379d9daf116093a3fc0bbf6ab1465505fe4c532c"
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
