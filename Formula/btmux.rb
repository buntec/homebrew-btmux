class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.191/btmux-aarch64-apple-darwin"
      sha256 "8100bb08b2e673eb8469e9f39b64154d72548ce44fc100980d602778f20d39a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.191/btmux-aarch64-unknown-linux-gnu"
      sha256 "db2ce5d9f7f5793f000f4088f8d629fd5855e8fa9e9e00c91a81110e340f9e74"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.191/btmux-x86_64-unknown-linux-gnu"
      sha256 "ae13683de34581102ffe8e5c565522baa9bb2f7e0ff0b8a01f2cccf6d9104b79"
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
