class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.142/btmux-aarch64-apple-darwin"
      sha256 "282901de4ece326c31143205b9d0885f0800ce077ea49e000a02b03c2c5320b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.142/btmux-aarch64-unknown-linux-gnu"
      sha256 "e24931fc0c50fdb1fe8656de156d5b641bbaf9529ce3b3aad782191ee54344e8"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.142/btmux-x86_64-unknown-linux-gnu"
      sha256 "ec1f06ed2684770276dcae0127bf3de7ec70118da46b5d3f367a92d959c4d580"
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
