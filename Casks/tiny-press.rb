cask "tiny-press" do
  version "0.1.0"
  sha256 "f110e2214d0058719387b53eb531f4458db9ac02e83b7d75b81705d4521b44af"

  url "https://github.com/hoemoon/tiny-press/releases/download/v#{version}/TinyPress-#{version}.dmg"
  name "tiny press"
  desc "Menu-bar companion that previews tiny press sites locally"
  homepage "https://github.com/hoemoon/tiny-press"

  depends_on macos: ">= :tahoe"

  app "TinyPress.app"

  zap trash: [
    "~/Library/Application Support/TinyPress",
    "~/Library/Caches/com.tinypress.app",
    "~/Library/HTTPStorages/com.tinypress.app",
    "~/Library/Preferences/com.tinypress.app.plist",
    "~/Library/Saved Application State/com.tinypress.app.savedState",
  ]
end
