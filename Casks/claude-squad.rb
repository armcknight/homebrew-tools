# claude-squad — stable channel.
#
# Bumped automatically by claude-squad's release workflow on any version tag.
# The version and sha256 below are placeholders until the first release runs;
# until then `brew install --cask claude-squad` 404s on the download.
#
# Unlike the CLI casks in this tap, this one installs a signed and notarized
# .app, so a plain `brew install --cask` works — no --no-quarantine needed.

cask "claude-squad" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/armcknight/homebrew-tools/releases/download/claude-squad-#{version}/claude-squad-#{version}.zip"
  name "Claude Squad"
  desc "Track the state of several Claude Code sessions at once"
  homepage "https://github.com/armcknight/homebrew-tools"

  # Every cask in this tap draws its assets from this one repo's releases, so
  # livecheck has to anchor on the `claude-squad-` tag prefix or it reports
  # whichever tool released most recently.
  livecheck do
    url :url
    regex(/^claude-squad[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :sonoma

  app "ClaudeSquad.app"

  zap trash: [
    "~/Library/Caches/io.mcknight.ClaudeSquad",
    "~/Library/HTTPStorages/io.mcknight.ClaudeSquad",
    "~/Library/Preferences/io.mcknight.ClaudeSquad.plist",
    "~/Library/Saved Application State/io.mcknight.ClaudeSquad.savedState",
  ]
end
