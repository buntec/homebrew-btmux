class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.168/btmux-aarch64-apple-darwin"
      sha256 "008cd52b6d3f484830281dbde781eafa98112f37bc3716c9c1c2195d9832abb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.168/btmux-aarch64-unknown-linux-gnu"
      sha256 "bed18fc23ffa3f2f1e66715809a01388ad3ceb983879455e52db9bdc0e910563"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.168/btmux-x86_64-unknown-linux-gnu"
      sha256 "96e1ee8abe2346c675fcc6a1659e89aaf4484a177c40bab6f3f454939c9c743a"
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
