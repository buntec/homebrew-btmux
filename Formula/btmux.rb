class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.151/btmux-aarch64-apple-darwin"
      sha256 "1d7110620f72838af14a65e5d147fc69194ed397b95a18404180cbc90d8c3721"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.151/btmux-aarch64-unknown-linux-gnu"
      sha256 "80a8cc9ae49af2d5f0ac0c5f57e67c5fa01ac6e71e03d2df68815db2bfbc4b5c"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.151/btmux-x86_64-unknown-linux-gnu"
      sha256 "db17318281a41337d2f3ee2ce12edb70496e01bfd119ac06cf7e916c252acfd4"
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
