class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.143/btmux-aarch64-apple-darwin"
      sha256 "2845fae9e432d3e392e7662bb50e75e2806a100264a309eabd75d7a6bb4fda8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.143/btmux-aarch64-unknown-linux-gnu"
      sha256 "3548359b8bb244bf82275f2dc6b290dbb2c8d6789f271a88de946312a24e86b2"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.143/btmux-x86_64-unknown-linux-gnu"
      sha256 "666176634624304f08579a3e7b065738b20f27836036852dfb3c9d8ed30a9c34"
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
