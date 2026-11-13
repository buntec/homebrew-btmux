class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.202/btmux-aarch64-apple-darwin"
      sha256 "dcfcd0fae5d476ee364ac5d0c258f65bf74807416a34dba7a9e687454d39d6c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.202/btmux-aarch64-unknown-linux-gnu"
      sha256 "5e3e67ecde14141a964fea1f0466612a26588cbd4ea6700cf97f5f7127ed2e79"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.202/btmux-x86_64-unknown-linux-gnu"
      sha256 "45f6a61be9f56fb607c918fa608f4a1d3ba1f94aa1724f36f305b40c9e675f51"
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
