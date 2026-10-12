class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.141/btmux-aarch64-apple-darwin"
      sha256 "d8ff72e6b2d482fe55c52a6e26725bd8977cf1ebc3161a05abdff259fe9a63d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.141/btmux-aarch64-unknown-linux-gnu"
      sha256 "04b624296fb8cd5342bca7fff4ca9e22c261aec280f036bc77ebb5aa25b4879b"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.141/btmux-x86_64-unknown-linux-gnu"
      sha256 "bcc107991bb55003a17ecccab7c3bf4dbdf3862e649b72b958f4d2dc1544a709"
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
