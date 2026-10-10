class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.131/btmux-aarch64-apple-darwin"
      sha256 "edb76fdb06b9c0dd036c7c382d4989d240a3c96c4d31771c7455573ab1a1fd22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.131/btmux-aarch64-unknown-linux-gnu"
      sha256 "34af5e374d40e2e19def9428428a23fc67c464f5cf35868348621203402c0dcf"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.131/btmux-x86_64-unknown-linux-gnu"
      sha256 "aa67c1113ff5300e3be64f0bf68e6190a394bf4655b340dbfd9efd5846099356"
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
