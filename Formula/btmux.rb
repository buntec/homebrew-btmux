class Btmux < Formula
  desc "Browser-based tmux"
  homepage "https://github.com/buntec/btmux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.120/btmux-aarch64-apple-darwin"
      sha256 "540b2e5a069be1b884c24ec5bd4a531a3275a7c82eb95e4c10663e3c24d3dba0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/buntec/btmux/releases/download/v0.0.120/btmux-aarch64-unknown-linux-gnu"
      sha256 "9a7aa928b58a828f4e37807b7f04e2cbfb2482bb98433d6f38abc3919d87c7bd"
    end
    on_intel do
      url "https://github.com/buntec/btmux/releases/download/v0.0.120/btmux-x86_64-unknown-linux-gnu"
      sha256 "7a7397210850a36c20ec9490234e5840199e6d45324ffbfba4f912a974b97e4e"
    end
  end

  def install
    bin.install Dir["btmux-*"].first => "btmux"
  end

  test do
    assert_match "Browser-based tmux", shell_output("#{bin}/btmux --help")
  end
end
