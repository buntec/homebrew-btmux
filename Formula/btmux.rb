class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.160/btmux-aarch64-apple-darwin"
      sha256 "903b20bcb780eb5f43e96f8e99ed4c36c780ad9ebc977c40f295e246c1282fbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.160/btmux-aarch64-unknown-linux-gnu"
      sha256 "7f09b28c816e1240560d4de39613616fc0a265eb40612a1194a19775211c9152"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.160/btmux-x86_64-unknown-linux-gnu"
      sha256 "117be3a8f7c5525c061b52eb334e5cb931841f1ebe1aed409dd053bfb74c5a8e"
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
