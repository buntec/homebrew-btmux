class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.124/btmux-aarch64-apple-darwin"
      sha256 "17f21e0f90ed8a8cc3ab9bee776dc1223d6d45849d24184d23f3f579517a9999"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.124/btmux-aarch64-unknown-linux-gnu"
      sha256 "01024a724816007f78ecab975cd5010e308d605de2c3920dbfe2e069ffcd4224"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.124/btmux-x86_64-unknown-linux-gnu"
      sha256 "4b8f4b15b1178b19bad1813ceef66a0da80f78743a3a0cb43cbd752d8ed12fef"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
