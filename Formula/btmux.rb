class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.138/btmux-aarch64-apple-darwin"
      sha256 "fa201b29c9b59376eac69bce0f2139975d3ddb22b5c3f24f0e74a4db924473d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.138/btmux-aarch64-unknown-linux-gnu"
      sha256 "da55871b8f9315859f10d20b0ffdd82974e41f3b57db45af5c1e841d606670ad"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.138/btmux-x86_64-unknown-linux-gnu"
      sha256 "6702748c61c60f98b20460cabedcb5afab1e21642e8c28f76246da09b6c3121d"
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
