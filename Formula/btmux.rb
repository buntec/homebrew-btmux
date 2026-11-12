class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.199/btmux-aarch64-apple-darwin"
      sha256 "56e97808b69f021b1dcd283146e0875c70573be908104fd1226cdf7e5e67612f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.199/btmux-aarch64-unknown-linux-gnu"
      sha256 "4193bda8ced205435de83fbe3d473ed0607b28051b429de21572aaba5c98d559"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.199/btmux-x86_64-unknown-linux-gnu"
      sha256 "d3c9d9f001dbc6c8a274c0da2937b4ceed0283af065c123b8702f69ecb653642"
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
