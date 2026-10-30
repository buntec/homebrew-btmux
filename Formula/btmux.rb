class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.175/btmux-aarch64-apple-darwin"
      sha256 "fc26b7d6a05cae9e24b19db49c8a8dd9be69a3b2b2e11836a8b46a12ddc1f9bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.175/btmux-aarch64-unknown-linux-gnu"
      sha256 "d083276d966d2fe09fe4a48bd0e37ab6fd231b00b577ee5f52309381bd1f95dc"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.175/btmux-x86_64-unknown-linux-gnu"
      sha256 "1d63e7c4be0e0e4e9f2ce0fb9847e9e385aaf3cb849f07e17e2d9a7277fe3763"
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
