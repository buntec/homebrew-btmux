class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.197/btmux-aarch64-apple-darwin"
      sha256 "ad4418b9ca2051a65d5432b195d43a9e4568444ae3a47eaac3d128013713d3fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.197/btmux-aarch64-unknown-linux-gnu"
      sha256 "ec50d15991e34312eec595221459563003b2adab9d929a2ff2c7e6947728be31"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.197/btmux-x86_64-unknown-linux-gnu"
      sha256 "70a17dd775e0bde73ed97dab5606aa48c3b393894d9f300b50dd920859b79e0f"
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
