class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.164/btmux-aarch64-apple-darwin"
      sha256 "c4b507757bc68d8048be34e51ad59098ac33a59a2843a6ae3ce5ef57bc9ae0a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.164/btmux-aarch64-unknown-linux-gnu"
      sha256 "acf2e208dccc60583b797338a105ef5145db7a6e44f23a7c5363d0d81ae5e271"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.164/btmux-x86_64-unknown-linux-gnu"
      sha256 "5745775a96de726e0b7961446ae4ca579ab7702b08aeff48ecdcc74a17b20714"
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
