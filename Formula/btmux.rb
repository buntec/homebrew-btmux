class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.200/btmux-aarch64-apple-darwin"
      sha256 "d2b814a0d8d342acf97b58f88c788a30940c05ec853a90fac1bab5d2a732a9bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.200/btmux-aarch64-unknown-linux-gnu"
      sha256 "0f7e549c2f1a2d605208fb5e600091e5193346f0a0c5839e7409a50fc3d7db97"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.200/btmux-x86_64-unknown-linux-gnu"
      sha256 "c6f84bff67e219ec2a0e3ac6bce3274b011d9beb2eb389ea4fd7ad0e1cd2bfcd"
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
