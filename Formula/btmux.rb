class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.193/btmux-aarch64-apple-darwin"
      sha256 "cf52fdf821a53a80c075f132d14043dc0c14c998fa3146ed4c5f2362a89c2844"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.193/btmux-aarch64-unknown-linux-gnu"
      sha256 "3f8d5694970fcd084ae1546a349b5e0795defb3e5593d41ffdd5c5566821a26f"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.193/btmux-x86_64-unknown-linux-gnu"
      sha256 "8a8d907b3f34a848a1f8a8a0bf2020c0fe7bd40003767e7f52828595eaa486cc"
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
