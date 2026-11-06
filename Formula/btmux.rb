class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.194/btmux-aarch64-apple-darwin"
      sha256 "fb97931cb99376cc1045449774cb812c26777d1ecff6581b6190d38e7d8ad2aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.194/btmux-aarch64-unknown-linux-gnu"
      sha256 "1ac26ff100aba9682b8cf8b37bd60b245a1ec973d24a539a795ffcbab26e7035"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.194/btmux-x86_64-unknown-linux-gnu"
      sha256 "c36bb06554d210aa2f13266c675eb3bdfae005651a095c9a78f69a7f301832e2"
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
