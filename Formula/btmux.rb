class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.153/btmux-aarch64-apple-darwin"
      sha256 "0fcdbb86cbda920240dae8fdd9264c3c3aa56f4399a747a34246c38ce4e58b8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.153/btmux-aarch64-unknown-linux-gnu"
      sha256 "3951c267c8ceae262f1309193af6a99edf18893d45caeec609b9e33e075ca941"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.153/btmux-x86_64-unknown-linux-gnu"
      sha256 "8abfb0ab33eb35630b96c892d0066147b84572e396f32d5a8dc15d01be4a448b"
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
