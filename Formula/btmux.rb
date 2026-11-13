class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.201/btmux-aarch64-apple-darwin"
      sha256 "305cffd1446ed98d1fcafbb98a1a1accae4d5cea8817b1a5bbfe9e72e0bdf422"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.201/btmux-aarch64-unknown-linux-gnu"
      sha256 "9bd4e50532998aacfc78df4f15aa567e317c67dabd536ed2a218b066ca8f79f0"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.201/btmux-x86_64-unknown-linux-gnu"
      sha256 "525a6996a7af63a79a2971764ec51977db9d9d27a8912e2bfa5f0b7ea1810fa6"
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
