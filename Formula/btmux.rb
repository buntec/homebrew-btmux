class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.115/btmux-aarch64-apple-darwin"
      sha256 "ff40bf310dffa40ffd6b2b0772e053493e92036fd3007417511461c13e9e4ca7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.115/btmux-aarch64-unknown-linux-gnu"
      sha256 "85033fd730210932847ea81ad486e6dfe2db5ea0bf06e95944649d10cd33b0e5"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.115/btmux-x86_64-unknown-linux-gnu"
      sha256 "cb8b6800074c72c720e2bf51fc06ad92a17701259368498e30b0bebdf3a40302"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
