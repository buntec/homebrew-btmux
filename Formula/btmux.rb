class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.188/btmux-aarch64-apple-darwin"
      sha256 "119ebe4cb5363c4d71d0bb52f42df7ddcc8643348f35f2d7ed1795f9fde50439"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.188/btmux-aarch64-unknown-linux-gnu"
      sha256 "f72492a87ef60721cdd39c7ce99c53974927cd3b42ccdc449f6e8278db508156"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.188/btmux-x86_64-unknown-linux-gnu"
      sha256 "c26f382551e5dc9233f88cb53c6abad5fe0039da19e7de0c5231e02e5af4da10"
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
