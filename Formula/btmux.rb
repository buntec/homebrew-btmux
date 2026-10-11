class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.135/btmux-aarch64-apple-darwin"
      sha256 "42cc52fc30c9728b8f6d01005c1049ae9440e9c918cff71f9fc9bd1b439b773f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.135/btmux-aarch64-unknown-linux-gnu"
      sha256 "9ab534aa68005101880e734c5f912db4c5af4fc3df679388b64de977a05fc135"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.135/btmux-x86_64-unknown-linux-gnu"
      sha256 "5fd3d707adc3c526d9f661323329cec72bf58757f09a49053ecd6abed11ee64b"
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
