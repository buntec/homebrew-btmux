class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.176/btmux-aarch64-apple-darwin"
      sha256 "e720890b6659ae48ffdedaae34c590fbfbe954e459ee290482370a6c9e12c15d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.176/btmux-aarch64-unknown-linux-gnu"
      sha256 "febac50c09caeb3e15668c07f75b79b2a64f0f4af6cdd8486071e4414dfe2e32"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.176/btmux-x86_64-unknown-linux-gnu"
      sha256 "1eaeef9dafbebebd8aa85ebc1d33101c786cd370fc2f094c64d0383bd35df81f"
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
