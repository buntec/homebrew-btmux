class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.127/btmux-aarch64-apple-darwin"
      sha256 "5527f1b33e068b2751cf8fac788f9e63d52089c3b6b3b7ed47c5a9fd9e9b3398"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.127/btmux-aarch64-unknown-linux-gnu"
      sha256 "e84866ff9808c0e09f4d6bf98cbb6dc6063e18ae92d7baa94ed5251734d8392b"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.127/btmux-x86_64-unknown-linux-gnu"
      sha256 "7489fa52c07242b1ede1eb871d0d3f68b26855e884ba3fbc8ea1e50a41190639"
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
