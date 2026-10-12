class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.140/btmux-aarch64-apple-darwin"
      sha256 "c365a6203bd064ef86268e971533cf48bb2f12ba0db98e5af8ccf7a4eea9c1c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.140/btmux-aarch64-unknown-linux-gnu"
      sha256 "0e712c5751b2b2e6c61efb262569d66687349d22124d113acbd1f8ec5ae28ca2"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.140/btmux-x86_64-unknown-linux-gnu"
      sha256 "459f0c179bbd08fb72b2aaaa72529048ecdbf74b3ac7848a423921239db92ac5"
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
