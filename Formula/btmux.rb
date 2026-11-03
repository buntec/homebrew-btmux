class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.185/btmux-aarch64-apple-darwin"
      sha256 "4843cbe834e6da0cd70c6709ccc5fdc7ef5b58f39a48f37cce794f70a81e2281"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.185/btmux-aarch64-unknown-linux-gnu"
      sha256 "d0e3eef2e730d9948df4ba1253034774e5eddea338281ba0e62f8688326a07bf"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.185/btmux-x86_64-unknown-linux-gnu"
      sha256 "ba8cc8eb341ca8ea59f4ebaf0db9a11345344997fadff8c5d84050cd604db8af"
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
