class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.121/btmux-aarch64-apple-darwin"
      sha256 "0a28766d05c249514c7a6723ec379ba7025f0e4f9fc31698b31665598b3909eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.121/btmux-aarch64-unknown-linux-gnu"
      sha256 "47a0fda2540d69f03108408cfb6f33e7d555b6e0aac579b58969e3b981841cf2"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.121/btmux-x86_64-unknown-linux-gnu"
      sha256 "abe81f51b4a57d1b25e3843c742c0f49ea422fe5dd7eb5ba9f471621d8564b65"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
