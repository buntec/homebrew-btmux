class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.167/btmux-aarch64-apple-darwin"
      sha256 "8ce970b0fc953c435c695846664e9acfc4408de739ece2be976a6eb52dc9b46a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.167/btmux-aarch64-unknown-linux-gnu"
      sha256 "d4664ba40fd10e4bf10394430a467c80419f094436945e5cb07cd07ce6cd4bae"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.167/btmux-x86_64-unknown-linux-gnu"
      sha256 "43b7c1219a849ec1cb4e0bafc5f6c40e755703fa1de04e836bacee39cced6e9c"
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
