class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.116/btmux-aarch64-apple-darwin"
      sha256 "e83e8b038398d1adca281bfd11ddb9c8b859a4406781c3d64e4cc527e1002c39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.116/btmux-aarch64-unknown-linux-gnu"
      sha256 "a08a04ef71cdd053e57e6c3d73395539abfa4c8607094a41823cbf715381fd55"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.116/btmux-x86_64-unknown-linux-gnu"
      sha256 "abf54f3837db5b63c95ddcb382838cbd1a4ea350fb2fdb9cc0ead3cf7581b7fb"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
