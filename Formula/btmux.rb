class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.165/btmux-aarch64-apple-darwin"
      sha256 "0c10fc232c2a7c8c353f979a15f764537d9afcff062b602b0c516be5c901f925"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.165/btmux-aarch64-unknown-linux-gnu"
      sha256 "f587c5828441bc73c511565666be1f6dd0a9009ebc9bffdd65373f7e16e1796a"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.165/btmux-x86_64-unknown-linux-gnu"
      sha256 "ff63d259878c9b51e2f4897b88a98835afd875a29373f5824690607e9c1f35ff"
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
