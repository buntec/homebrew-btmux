class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.161/btmux-aarch64-apple-darwin"
      sha256 "4c425493ef415b824f23068f1426df3976181e50ca89a1cc0d20dd6ad51d0261"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.161/btmux-aarch64-unknown-linux-gnu"
      sha256 "f2b20dfbac02640525fc1b5b9e944bc05dfa024afd36971e2c72f575f04ea111"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.161/btmux-x86_64-unknown-linux-gnu"
      sha256 "71d926a844090978bab4b108392c3045afb6f3a2a1e5b94423ed4197b200e3b6"
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
