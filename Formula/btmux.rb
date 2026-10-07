class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.122/btmux-aarch64-apple-darwin"
      sha256 "07a84bbf01c983f8546cd181def5ec35fa3106ffc88be242e4a7ae4178115e39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.122/btmux-aarch64-unknown-linux-gnu"
      sha256 "0f21cc307c6ab53808411f4e62ff4100670061e70642de58b240f6853e9ecdae"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.122/btmux-x86_64-unknown-linux-gnu"
      sha256 "3a76971eb41da6d1ba0b6a7ad0bfd7f9b182d558a7e2f920663b871270bae15d"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
