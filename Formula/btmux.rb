class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.123/btmux-aarch64-apple-darwin"
      sha256 "c1d5cc550f7af9e26e11edb969d0aceecded01fa19d2304b26829ed53e921ee8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.123/btmux-aarch64-unknown-linux-gnu"
      sha256 "3cb3183dc65f35e75413187fd1a4c946196727165ebd0d109c430a5aea5eb942"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.123/btmux-x86_64-unknown-linux-gnu"
      sha256 "d3066d0812a170cd683683ab0bafb3e0630c32446835bbd44b2f55e66ef7268e"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
