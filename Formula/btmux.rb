class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.130/btmux-aarch64-apple-darwin"
      sha256 "b580114f54d7f0c5e9db8400be24e372c84451b970aa786ddd0e934f0df7fa61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.130/btmux-aarch64-unknown-linux-gnu"
      sha256 "5dd29003434bf551367ccb9da2a196ef26743a59c97e7d7eaa41a059c79fd285"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.130/btmux-x86_64-unknown-linux-gnu"
      sha256 "4df0f86ed69fac339f13877c2a2051ecc3c130f1f73085f81717af592b8625ef"
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
