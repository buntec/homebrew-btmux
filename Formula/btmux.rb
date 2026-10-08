class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.126/btmux-aarch64-apple-darwin"
      sha256 "e4bab90f0e0e1a60436ff83cdf29c10955d2242f3d6c68c624438af6ef14f777"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.126/btmux-aarch64-unknown-linux-gnu"
      sha256 "6677bbd2ba3fd23cd65d03bfa614da3e18b724694d486c34a4f83165f77e17b9"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.126/btmux-x86_64-unknown-linux-gnu"
      sha256 "9bc7499f28fc44441f8903643f66c5651441912eaaaac586b7864a97d029638e"
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
