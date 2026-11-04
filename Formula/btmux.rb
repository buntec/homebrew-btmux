class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.186/btmux-aarch64-apple-darwin"
      sha256 "88f8bc739a7ff9044786b6890b31be6b066adbd7cb1a889cf54aabad2dcc22f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.186/btmux-aarch64-unknown-linux-gnu"
      sha256 "42c1e8f5a53368486c25fbc65ce64b0acd14706260809346d143c94a0755bcfb"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.186/btmux-x86_64-unknown-linux-gnu"
      sha256 "33dfa9a1be366ef9b2acefb188dfc9f771ae3f183e46fc9db19a1e2427135cb8"
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
