class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.118/btmux-aarch64-apple-darwin"
      sha256 "e7551decad17a709191615bf5d500dd5ec7178cb3351a51a2aac5a41b5fcb088"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.118/btmux-aarch64-unknown-linux-gnu"
      sha256 "99c8d7800461041f3d4b247e909369874cd23bc01c38a0e1f0c3e7e548a9b533"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.118/btmux-x86_64-unknown-linux-gnu"
      sha256 "206cc7b1f306f4f01a1cd2639122db2aa3a0de7e084da35ecb26c8a6cf6255da"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
