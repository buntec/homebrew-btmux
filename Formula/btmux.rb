class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.139/btmux-aarch64-apple-darwin"
      sha256 "3a507bb813e572e8ee5ed9102a2b7c33ac91096adb94571bced477445fc78647"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.139/btmux-aarch64-unknown-linux-gnu"
      sha256 "9be27514d56cbdc478ce828fb04ff22fb9b254e94e7ae80effaa0b5d08a11347"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.139/btmux-x86_64-unknown-linux-gnu"
      sha256 "cfc2068a11d7e6fedc914f017bb357984c020f370c890208a632010ed7aee465"
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
