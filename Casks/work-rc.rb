# work — release-candidate channel.
#
# Bumped automatically by workr's release workflow on any RC tag
# (e.g. 1.2.1-RC1). Until the first RC is published this file is pinned
# to the latest stable release.
#
# To opt into RC builds:   brew install --cask armcknight/tools/work-rc
# To go back to stable:    brew uninstall --cask work-rc && brew install --cask armcknight/tools/work

cask "work-rc" do
  version "1.2.0"
  sha256 "2d45bc506c8455eea0d35a9e4151f906f81c2c5f9ba853501dd6ed723b3f08db"

  url "https://github.com/armcknight/homebrew-tools/releases/download/work-#{version}/work-#{version}-aarch64-apple-darwin.tar.gz"
  name "work (release candidate)"
  desc "Worktree, tmux session, and Coder workspace manager (RC channel)"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  conflicts_with cask: "armcknight/tools/work"

  binary "work"

  zap trash: "~/.config/work"
end
