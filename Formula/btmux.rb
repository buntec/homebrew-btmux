class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.184/btmux-aarch64-apple-darwin"
      sha256 "3e3005b68cbfa041e7be435a675e710191db0078c7fc3521a420847afb883445"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.184/btmux-aarch64-unknown-linux-gnu"
      sha256 "9ee693620adf028c19959f50ebbc373e35a91ca2201e866d4b462aa25ecf4880"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.184/btmux-x86_64-unknown-linux-gnu"
      sha256 "b34bc80ea2e841c2ebf580fc962c7da8041d1d32a18fa413aeaad37ea283c3a9"
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
