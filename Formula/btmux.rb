class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.203/btmux-aarch64-apple-darwin"
      sha256 "ede7499df1693b0c02b9f94a54300f5c925edbfa5aa78c85075d209e438a86b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.203/btmux-aarch64-unknown-linux-gnu"
      sha256 "dc3864e76334f28600f10c40efa9782f7598952d978a0e45acbaaf8f7f4b260d"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.203/btmux-x86_64-unknown-linux-gnu"
      sha256 "f7c256d6f66dbee6ac3300bf5fd4cad7572338e76528f6db7be5bed0c09da8af"
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
