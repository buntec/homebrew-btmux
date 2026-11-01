class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.181/btmux-aarch64-apple-darwin"
      sha256 "18055c8038d4c34ee49d7cb32abde18da74ecbdf1ebd10e96753860ff1db22c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.181/btmux-aarch64-unknown-linux-gnu"
      sha256 "647d8d1bb22a1f43c00374c279da4729ba16f5750dc5c0bca0a6f7a8750fef3e"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.181/btmux-x86_64-unknown-linux-gnu"
      sha256 "345d6e5053a7f4301cb5e07f266ce2cd2692feba67847637ddb6a31fe6f8db7f"
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
