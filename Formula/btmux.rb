class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.147/btmux-aarch64-apple-darwin"
      sha256 "8c1c28c45f47977788eeb7e3fe20ee03dc358480e44177d725715fe22dbc28de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.147/btmux-aarch64-unknown-linux-gnu"
      sha256 "8c8c6684f1716052a40ac84478b3c2973a8a92b0acafcdb1cce3910d3deeeb69"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.147/btmux-x86_64-unknown-linux-gnu"
      sha256 "8157bb0efdf37d7b1f6a3b65c8d86cb7fd87c4fc0044f614789fe3e16f9c9f9b"
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
