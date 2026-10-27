class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.166/btmux-aarch64-apple-darwin"
      sha256 "dcac6041acd2e7a7f4ae99272a3e5a1a758dafc03f1bae1d516d86c19026fbd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.166/btmux-aarch64-unknown-linux-gnu"
      sha256 "87a1a9d4a23974233cd08d01b8a66f05d00b1008d69fd18a9263921b515738ca"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.166/btmux-x86_64-unknown-linux-gnu"
      sha256 "7d6794c499056fd196a028906615215ca39f89336abb6aa2088f6fda83ac9b00"
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
