class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.134/btmux-aarch64-apple-darwin"
      sha256 "6f4b966ecc11e06a17dcb75c9e3e17ba2f996a27a1ce31b8487f18e0f0e8d6b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.134/btmux-aarch64-unknown-linux-gnu"
      sha256 "825ef3588e170fb56078fbb1b5a2657a4f48ae574fea9893c38dcd5fc18863f3"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.134/btmux-x86_64-unknown-linux-gnu"
      sha256 "0b91e6f234248558bfd566ef6e363a0df1e8496e28a6db48d2bc4a3f08bc2317"
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
