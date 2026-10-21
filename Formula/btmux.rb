class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.158/btmux-aarch64-apple-darwin"
      sha256 "ddaf215e8a13a79ffb9a07315bb9818b70cd1e6b266500db29b36428c44f9e43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.158/btmux-aarch64-unknown-linux-gnu"
      sha256 "2db477eb340a0f9df76bf857c040a42e5f0382388af721d0c0a892dd22fb2b30"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.158/btmux-x86_64-unknown-linux-gnu"
      sha256 "5cbf1778bc95ec2bdbdbc6ca66e471951cbcc9c204558c25b5e5fc2cce886f25"
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
