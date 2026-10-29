class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.173/btmux-aarch64-apple-darwin"
      sha256 "672163e85b625778744c9977cfcc782e622c31904c0684c842635089ced21d79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.173/btmux-aarch64-unknown-linux-gnu"
      sha256 "b60c2684928ecf051f21cd1897153125edb2c622a1f45630c3696bd5025da5e3"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.173/btmux-x86_64-unknown-linux-gnu"
      sha256 "3e836939e1b7f35d4452e4fcf177656627a63af6b2ff20ebcd75e6ae041b9679"
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
