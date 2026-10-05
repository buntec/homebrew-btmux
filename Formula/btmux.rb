class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.117/btmux-aarch64-apple-darwin"
      sha256 "a54408a9c1c95488ed1831bf064a5b3c0daf66ea88236b888a35e11700862cb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.117/btmux-aarch64-unknown-linux-gnu"
      sha256 "fe9a53bf648ad4ba38cd91bbf68cc7fdec49c279661bd04b1b1ea3e4b2fa999a"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.117/btmux-x86_64-unknown-linux-gnu"
      sha256 "a0be4a6c9d53de4ecbedadd5048e74d462fe0ed8413929c58a7f89cc31186db9"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
