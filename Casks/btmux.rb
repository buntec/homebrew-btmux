cask "btmux" do
  version "0.0.127"
  sha256 "d5f0486628eec5b95d0b7fbdac20410566c8a33e8c87dc113efe59c0414c8801"

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
