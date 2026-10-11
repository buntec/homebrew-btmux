class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.132/btmux-aarch64-apple-darwin"
      sha256 "c2b1450852f0ca0afe5c4cd9d400ae789272daf54a30d13ca13a461423253fcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.132/btmux-aarch64-unknown-linux-gnu"
      sha256 "33cbc9915af4d4ed6c6294c2ac5311e83b85cd1e496f785085f2436ae421d888"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.132/btmux-x86_64-unknown-linux-gnu"
      sha256 "3df71afba10e2211090152ecaa40445025f4be7f7ab0f03ba010ea090c694253"
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
