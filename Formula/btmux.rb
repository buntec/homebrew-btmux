class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.169/btmux-aarch64-apple-darwin"
      sha256 "c2d67fdc3c2df396b6d408b7cb072f82f8e93c68dea1d837892dba7f4aa2ed5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.169/btmux-aarch64-unknown-linux-gnu"
      sha256 "2f2b95701abac9c6b9583d07ea0a8d696db2156fbea6ad37787511fd4363e531"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.169/btmux-x86_64-unknown-linux-gnu"
      sha256 "72eeaa16fbdcf051d77400da603fd046899ca868cfec7ee6e884ccb453968eb1"
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
