class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.136/btmux-aarch64-apple-darwin"
      sha256 "c304b1f0050f32a6326a150e3f7869d351af0b4f43f0db2d92695b767d1e17b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.136/btmux-aarch64-unknown-linux-gnu"
      sha256 "06ba53c640343f544316d58ced319c58381a476b7c6e4165a88fca5cb1711901"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.136/btmux-x86_64-unknown-linux-gnu"
      sha256 "ef8541db448fe236982e84bf32fb087249d6da05194e6f2ea1dfde421cd973f5"
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
