class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.149/btmux-aarch64-apple-darwin"
      sha256 "7f891ae08176ec074bb3cdb41aeb3cd9c68aee7bf7bb2ba3f55e5f2c783bbdbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.149/btmux-aarch64-unknown-linux-gnu"
      sha256 "2f67e62beac456a62bb8e7807d9c7c4a6bf4897f8b16371ab7f320e8737a29b1"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.149/btmux-x86_64-unknown-linux-gnu"
      sha256 "29b4c0f29875fe73b281c1eabb16b7923a95194cb8d48d8d4aa184a9b2e6b4df"
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
