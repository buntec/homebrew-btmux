cask "btmux" do
  version "0.0.131"
  sha256 "07219e9cc96a2594362e5f7b3e4ebaa3fa733e733e21216cbbdc951e829bddc4"

  url "https://github.com/buntec/btmux/releases/download/v#{version}/btmux-desktop-aarch64-apple-darwin.zip"
  name "btmux"
  desc "Desktop client for btmux"
  homepage "https://github.com/buntec/btmux"

  depends_on arch: :arm64

  app "btmux.app"

  # Ad-hoc signed, not notarized.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/btmux.app"],
        writable_paths: ["btmux.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Support/btmux-desktop",
    "~/Library/Application Support/com.btmux.desktop",
    "~/Library/Caches/btmux-desktop",
    "~/Library/Caches/com.btmux.desktop",
    "~/Library/WebKit/btmux-desktop",
    "~/Library/WebKit/com.btmux.desktop",
  ]
end
