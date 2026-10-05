class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.114/btmux-aarch64-apple-darwin"
      sha256 "945412e2686f75400f49d87cdf04749e35f6f7c111bac1e19de8e3005d5b8c78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.114/btmux-aarch64-unknown-linux-gnu"
      sha256 "390699727aa60b28f95a276dea1a2585ade1db35224df32886331d568b817ef7"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.114/btmux-x86_64-unknown-linux-gnu"
      sha256 "20bd2f7afcf33e75e7f9ce73d015a329c08ad60104e83f88fb181f025068a0e0"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
