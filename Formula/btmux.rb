class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.128/btmux-aarch64-apple-darwin"
      sha256 "11be5559bc87acf1d86fc7bc5571822a509724e26915b95d212cc7bcb7e5c490"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.128/btmux-aarch64-unknown-linux-gnu"
      sha256 "cc6661677cad52ee60bfebb931f18bc770b45dc50b5ad4102d74a7726900735e"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.128/btmux-x86_64-unknown-linux-gnu"
      sha256 "0411f4c1c9236bd283dbb2b53de7852ba8fab3ff2f9f781ce735a2d56f6dfc4c"
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
