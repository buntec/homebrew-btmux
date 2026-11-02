class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.183/btmux-aarch64-apple-darwin"
      sha256 "2255def40e1f4a0cc8a740024e9f13d7bdd6695f6250dbc1c0a21dce16ffd8fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.183/btmux-aarch64-unknown-linux-gnu"
      sha256 "ba7ef7eddf57f5b2e8aa17d94c62b779bb7b26565cc2893909d48d7b35150759"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.183/btmux-x86_64-unknown-linux-gnu"
      sha256 "3134e82810fcb47ce49bd1590a14cc862150d5cd45a3a5fa67936e471a5490ac"
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
