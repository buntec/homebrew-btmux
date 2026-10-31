class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.177/btmux-aarch64-apple-darwin"
      sha256 "28532e850cf81c9a013466aa512dd670c178d0d59373afe5bffc87001155d4dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.177/btmux-aarch64-unknown-linux-gnu"
      sha256 "be9c6d9503fc4a3acce12f16e7b555e75e3f32ffb2a60fe96c655d0bb93e04ea"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.177/btmux-x86_64-unknown-linux-gnu"
      sha256 "86b286ff0d4c747a10ed02ab3cbe980be61403e75cd3422bc98a34bf0531d7f6"
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
