class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.192/btmux-aarch64-apple-darwin"
      sha256 "1ad1a24da5778be708d6f9331d4db8b87eb2967bac7d905125faa97a51cff987"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.192/btmux-aarch64-unknown-linux-gnu"
      sha256 "8bca98953bc39e433b086e5676c45798b3a883b48263ec5320e308565272b4c1"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.192/btmux-x86_64-unknown-linux-gnu"
      sha256 "eb9fc9685f8e1d9a0658c549751e1e3d78d32312c81de0d91c99ddfc25c17eda"
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
