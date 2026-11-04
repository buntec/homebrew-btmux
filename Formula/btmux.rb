class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.187/btmux-aarch64-apple-darwin"
      sha256 "790634009a80873c6229893de7e23f43d2ec85fa64748446c4182fd297d689a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.187/btmux-aarch64-unknown-linux-gnu"
      sha256 "0fc6a83a0b2b7a73468d5a40dd809280bed4314d2cd2f90eecd793cc0c997bb7"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.187/btmux-x86_64-unknown-linux-gnu"
      sha256 "a557d10ab86c09d8664528da3b2e7743458a75530a3c473ac4a74297ff98339a"
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
