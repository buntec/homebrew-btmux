class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.171/btmux-aarch64-apple-darwin"
      sha256 "eb5bddf11ca56ac661cc2ed6cb17092264f67127ac4e693e8d5251b4f8f64d55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.171/btmux-aarch64-unknown-linux-gnu"
      sha256 "ce6733f07bb78289f11fc0e716a45540d1a6bbd10ef2d18ea99cf8d95f8f4f8e"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.171/btmux-x86_64-unknown-linux-gnu"
      sha256 "1d574444e31c21a0c281acf4df7d3289482cf5dc26933970f685c7c10eb4dbe1"
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
