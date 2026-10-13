class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.144/btmux-aarch64-apple-darwin"
      sha256 "328082cbaa24f1990ceff9ac4c8651b331f9d8a5fca5c60548deef7745465a27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.144/btmux-aarch64-unknown-linux-gnu"
      sha256 "e2f0f6d27d5229e380f54d0bb10e03c59eae0c0fe5fef9353f2f1d3a26e5ee29"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.144/btmux-x86_64-unknown-linux-gnu"
      sha256 "82f0b0d49c6c6eb9bcb66d8f30d716a0f26df978674123c069445e0751db17b1"
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
