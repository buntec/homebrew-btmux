class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.129/btmux-aarch64-apple-darwin"
      sha256 "da56a169adf29fc37cd6a0903a51533f155a1fd334f22a6785f8fe12dd215afe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.129/btmux-aarch64-unknown-linux-gnu"
      sha256 "2b9e1d2f335a361c43e4377068701cfd1dda7f63a65e24644cba1a8e64b19125"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.129/btmux-x86_64-unknown-linux-gnu"
      sha256 "5c302be3540f0fc7340e7272b634b0fef06f42314e64fd3e4e67d64add5a94f1"
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
