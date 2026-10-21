class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.159/btmux-aarch64-apple-darwin"
      sha256 "a2ca24fd3cb5c7880c226f6b9146c65af8af786372cfd430e798c19e30600198"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.159/btmux-aarch64-unknown-linux-gnu"
      sha256 "453aa1935ca68a6953fbc91cb631634457a57b02da9e6b05459cb0851fb48198"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.159/btmux-x86_64-unknown-linux-gnu"
      sha256 "30c9b1710e06b7cfa377d88ece1cd740c19d1b720244c4b7be5fbaa9389104bc"
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
