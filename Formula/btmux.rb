class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.137/btmux-aarch64-apple-darwin"
      sha256 "de8b8e1e5f6fceba0323e06254e36c8b3d4a97efa31fd533ddf814f8fe7a86f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.137/btmux-aarch64-unknown-linux-gnu"
      sha256 "1bf37e9c0b84849974ad1da25dea08fb0039d75f684842e2053a1a96d15199c1"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.137/btmux-x86_64-unknown-linux-gnu"
      sha256 "bd5f93d86fc9a603ef722f5abef4e6f26ecfded9f087738a308256c74486c487"
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
