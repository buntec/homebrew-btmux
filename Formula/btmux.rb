class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.189/btmux-aarch64-apple-darwin"
      sha256 "38ca6b48f76876184eed0e156b0470bcdd31611b582972cdde0ae2ba2fb232c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.189/btmux-aarch64-unknown-linux-gnu"
      sha256 "966b6812eac26ae54173498c0633cf1d3e8b96c290352c5d0b13b41f43ffe75a"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.189/btmux-x86_64-unknown-linux-gnu"
      sha256 "c340ca316ccecd932db75d569dcf8b20b966989c677b8c590f91aed76535b32e"
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
