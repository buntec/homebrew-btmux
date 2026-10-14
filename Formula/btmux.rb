class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.145/btmux-aarch64-apple-darwin"
      sha256 "782858bc22f36ea35ece2dc06a34ec2ed355ff52a68e4b369cee39ff52cde592"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.145/btmux-aarch64-unknown-linux-gnu"
      sha256 "40e0446daf2c93177709f20c6af9f4c0fdcdce7bb99758b466a732732cdd1caa"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.145/btmux-x86_64-unknown-linux-gnu"
      sha256 "26982df9382cefef7a8779bf8bcd27c7e807f723f3ee467ace1b23b472e85ceb"
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
