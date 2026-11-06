cask "btmux" do
  version "0.0.194"
  sha256 "6e7516b44fe1364794fc667cf8b1bf3ac84466e660e1e27831fa058c8b0784e4"

  url "https://github.com/buntec/btmux/releases/download/v#{version}/btmux-desktop-aarch64-apple-darwin.zip"
  name "btmux"
  desc "Desktop client for btmux"
  homepage "https://github.com/buntec/btmux"

  depends_on arch: :arm64

  app "btmux.app"

  zap trash: [
    "~/Library/Application Support/btmux-desktop",
    "~/Library/Application Support/com.btmux.desktop",
    "~/Library/Caches/btmux-desktop",
    "~/Library/Caches/com.btmux.desktop",
    "~/Library/WebKit/btmux-desktop",
    "~/Library/WebKit/com.btmux.desktop",
  ]
end
