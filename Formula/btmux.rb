class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.172/btmux-aarch64-apple-darwin"
      sha256 "3830bc6b426a8e4e56cef0dff51b41d6a30f2d58a4fa590dd03e08b3b38f4cc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.172/btmux-aarch64-unknown-linux-gnu"
      sha256 "b5884b88697ceb5fdc9be11904264d1f54031513dbe0dcfd7515238517cd2758"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.172/btmux-x86_64-unknown-linux-gnu"
      sha256 "8176dfa7263cf8dc05d58d0abc64e7f2307c6907073b5e3207ed6bc658282111"
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
