class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.190/btmux-aarch64-apple-darwin"
      sha256 "c6a25a5bd9606dffea6aaf595ddf0a92f0d2c7ca7299941af9338809560e5465"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.190/btmux-aarch64-unknown-linux-gnu"
      sha256 "9f58c174f58ed8e950b0c34cf453db3ec7edae769a9a28c8657bd565322388ae"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.190/btmux-x86_64-unknown-linux-gnu"
      sha256 "df00f5704ffb727081e06a7656238e1026382cd76425c5082003d56194749b6a"
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
