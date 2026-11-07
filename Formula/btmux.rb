class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.195/btmux-aarch64-apple-darwin"
      sha256 "542cec8846e63bf52fa6b1b4c90a2e26abff89c8bd1a8e8ba62dc42733068f80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.195/btmux-aarch64-unknown-linux-gnu"
      sha256 "132f4b1fe3523dd2c7dda89dccc31244dc034a10fa77c670c28e327fe402c9d5"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.195/btmux-x86_64-unknown-linux-gnu"
      sha256 "c6943d73182dad0796f7066ed86615b8ba1697ee9a69b4e917c05fdbc3c11b2c"
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
