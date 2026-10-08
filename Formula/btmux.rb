class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.125/btmux-aarch64-apple-darwin"
      sha256 "c072cdd73b2518623542518dd0769a61f64a641c8f6fb47bc70000fcfe0303e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.125/btmux-aarch64-unknown-linux-gnu"
      sha256 "1414842c128bd22e2f9aba19f7087df100d1f67db7f578cadf6d87c1d21a5ebf"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.125/btmux-x86_64-unknown-linux-gnu"
      sha256 "ce905328702158bf8ac9e3310e3e946f2d53c81437b31e0347f0f48caa06a9ba"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
