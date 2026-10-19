class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.152/btmux-aarch64-apple-darwin"
      sha256 "1c40c23a7f53310750fadeccd9ec9a96e844eaa805cf4c46bc4bb7366e96402c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.152/btmux-aarch64-unknown-linux-gnu"
      sha256 "0ecb1c56eeeb2441132d3ced868f516820556c154c9031181d1584a23665428a"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.152/btmux-x86_64-unknown-linux-gnu"
      sha256 "7e24bc66464e0b4f64022f1b20f4a530cfdbdd26bc363e6ee46c5b3b00cdc809"
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
