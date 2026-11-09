class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.196/btmux-aarch64-apple-darwin"
      sha256 "476a2d7c6d7d097ef1eb0a97665fe0da5fed100de17d2c250aea3344f97e522e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.196/btmux-aarch64-unknown-linux-gnu"
      sha256 "d6581af2610f1effca0d14fff357b3773b100f55aeb367b31174695d5e7eb81a"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.196/btmux-x86_64-unknown-linux-gnu"
      sha256 "3fa2ef74df2b307e8a2df1222882bfaddc3adbdb7fb4db9ef56b20e45766a4fc"
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
