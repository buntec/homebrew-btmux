class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.150/btmux-aarch64-apple-darwin"
      sha256 "24cc070f3cf9c48322c9fe280ba8b03e945dbf1d1e95ed4c269ba3a37ba987fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.150/btmux-aarch64-unknown-linux-gnu"
      sha256 "b0f8097f1cce3707bb91d56fa62456f7559e718ab156fc3cc7dab458eb6fdbf8"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.150/btmux-x86_64-unknown-linux-gnu"
      sha256 "6be2e1ebafad91afd3b7b600d81f73318c14177753f6299162f9da59612e04bf"
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
