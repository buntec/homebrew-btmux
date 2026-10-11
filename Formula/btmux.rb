class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.133/btmux-aarch64-apple-darwin"
      sha256 "00350d83dab734328bbdc567ddc7665ac759760f9bf03e13a8cb4f1d62cc132b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.133/btmux-aarch64-unknown-linux-gnu"
      sha256 "dc20a056883926da451151e62c7a55d8f0a8271b4dbeaf861c0dd09d9375cf99"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.133/btmux-x86_64-unknown-linux-gnu"
      sha256 "d40418666b4f168fd2a2c60c1516bf3d9b7f4529f7e983c2ed67e430f9af7b27"
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
