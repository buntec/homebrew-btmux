class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.119/btmux-aarch64-apple-darwin"
      sha256 "efb00741d786601ae8736eb64bf445322e2a854427c167fa006c6c1cec5d675d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.119/btmux-aarch64-unknown-linux-gnu"
      sha256 "f08b164738343423c7cbe66149586cefe9a79603a42a67779c00cf3daa96f652"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.119/btmux-x86_64-unknown-linux-gnu"
      sha256 "bd77e2b3198507ae121fcbc28f1948b807939bb43a330b0f64344a3683d6aa20"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
