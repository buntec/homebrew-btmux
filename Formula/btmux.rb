class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.148/btmux-aarch64-apple-darwin"
      sha256 "efafde2dd06f48f11d617420258c581c5209738c8ce6366ba3d0448ea372498a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.148/btmux-aarch64-unknown-linux-gnu"
      sha256 "b6159e783ff9d1c29b7b58a31efa4aaaa22d4cfbe2ad931172e788d3c4706e10"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.148/btmux-x86_64-unknown-linux-gnu"
      sha256 "81f00c56a60b737966cfcf710d00876bb1904a2232f3f556d7d8cf1b5d12a2e2"
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
