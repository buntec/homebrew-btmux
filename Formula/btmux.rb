class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.154/btmux-aarch64-apple-darwin"
      sha256 "cb903d6d27b3aba4aa4a0c1fe50c91e50576ff97cc5ac3999e717ef5e8358427"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.154/btmux-aarch64-unknown-linux-gnu"
      sha256 "e67e0400d71d72702dc5e1953db3160b09cfed4443d44b0d634c4f4f85233012"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.154/btmux-x86_64-unknown-linux-gnu"
      sha256 "549f0fa1125044d5a204076d3590f93811c147466874878bf7b63d915a897988"
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
