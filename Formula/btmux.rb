class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.156/btmux-aarch64-apple-darwin"
      sha256 "b549d41c78e5aeea14f9414c0d0741ff252096a50f70b3daa576b3ca8130b70b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.156/btmux-aarch64-unknown-linux-gnu"
      sha256 "3dd841eeb1f69c11b5d9449afd88861df7d221ffe21c5d60c4e0f2a5afb5a86c"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.156/btmux-x86_64-unknown-linux-gnu"
      sha256 "8a7ebb4423ff1cf5a17946e9aaff17640d428255183629bf073430bafde707a1"
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
