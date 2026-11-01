class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.180/btmux-aarch64-apple-darwin"
      sha256 "ada3d86e8a3ebe1e26d54bf47d153a05bcea69c35cfbcf901c967741ec007f00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.180/btmux-aarch64-unknown-linux-gnu"
      sha256 "20fea347082f5a7e3c9e97b7bd23f2643ef6147bb08944be64bd8c55295a1740"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.180/btmux-x86_64-unknown-linux-gnu"
      sha256 "e725ae44172a146fb8cb4e7206ffb5456c1f1ee9bf6424fff40e9384c7d5b718"
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
