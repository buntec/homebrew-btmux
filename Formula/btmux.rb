class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.198/btmux-aarch64-apple-darwin"
      sha256 "2d00f1196c9b4e24569095268dd4377bad6ece27d539faafdc9315e48e2fff6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.198/btmux-aarch64-unknown-linux-gnu"
      sha256 "76b9ecc638865ccf52fd1ad0fac97f4fc64f4730ed9d4a8efac5369cd47fd264"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.198/btmux-x86_64-unknown-linux-gnu"
      sha256 "eec28142d3b27eb93aabba375ad801e9ff8469f021aad53fbfba5f64429e4fab"
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
