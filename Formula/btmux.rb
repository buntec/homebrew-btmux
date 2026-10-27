class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.170/btmux-aarch64-apple-darwin"
      sha256 "73b5e7198c18b7f65d2ca7f812b2f97be5aa5656367fd8ac05a85f002bb9cc87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.170/btmux-aarch64-unknown-linux-gnu"
      sha256 "95f669df14a3e4451b88d03346b85519c9ce2f96b8637a4db362bbe43dac53d4"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.170/btmux-x86_64-unknown-linux-gnu"
      sha256 "c67b1b6ef9624fdb0dea4090cb561346462a213bb02eaf294fe818b7b6b4e580"
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
