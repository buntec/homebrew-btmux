class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.182/btmux-aarch64-apple-darwin"
      sha256 "a746c9c7611f04d3405f0b8223a94a3de2a7001910fe663a9395e555f965f74d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.182/btmux-aarch64-unknown-linux-gnu"
      sha256 "fabcddafc6eabffbd0c5d753558a986831a1e968d803e71560090139a7e16d50"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.182/btmux-x86_64-unknown-linux-gnu"
      sha256 "a457c1363766f9f40e656867b9ffb87d11b7475f673d71fff147906eb5176ec5"
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
