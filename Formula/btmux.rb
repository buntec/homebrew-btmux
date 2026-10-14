class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.146/btmux-aarch64-apple-darwin"
      sha256 "59293c8b23bfccf6e16176afe9bfb74c468838f13c0484b16c3d1f58d9ba8554"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.146/btmux-aarch64-unknown-linux-gnu"
      sha256 "91f262b3ecd4d354b74591068cec66e1f6f9569f2c9637076ddc604cc3e26762"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.146/btmux-x86_64-unknown-linux-gnu"
      sha256 "43846cbc8f510106474df3663114451dcc9793da2eb4ee60f6fddcf8379ba5f6"
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
