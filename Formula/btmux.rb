class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.163/btmux-aarch64-apple-darwin"
      sha256 "a695a6696293c5fca8cd09687d5be3b1df2533e4a66545ae47be8bce49383ddc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.163/btmux-aarch64-unknown-linux-gnu"
      sha256 "8762140181b5d9f98e5acaebdcbe6df79e680d897c1196de55b7d8b6cd0763af"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.163/btmux-x86_64-unknown-linux-gnu"
      sha256 "cfcbe1968eb02e2abead20639394ff2cf901441f372635a66afaf652a39cc7b4"
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
