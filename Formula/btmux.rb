class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.178/btmux-aarch64-apple-darwin"
      sha256 "9e5a0a290cf700bff4f544d9907acfd88ed0bb32950a528c4083e207176f6f53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.178/btmux-aarch64-unknown-linux-gnu"
      sha256 "40ffa19b9db99b93f4c9a7a731c02bca332adee0c26289bf0b965c082f6cbb1e"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.178/btmux-x86_64-unknown-linux-gnu"
      sha256 "32df0b2de71fe6aad8e33fb220326198ef719c326a1d1c0dff8d1d4c68d3a436"
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
