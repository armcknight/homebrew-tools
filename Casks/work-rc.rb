# work — release-candidate channel.
#
# Bumped automatically by workr's release workflow on any RC tag
# (e.g. 0.1.1-rc.1). Until the first RC is published this file is pinned
# to the latest stable release.
#
# To opt into RC builds:   brew install --cask armcknight/tools/work-rc
# To go back to stable:    brew uninstall --cask work-rc && brew install --cask armcknight/tools/work

cask "work-rc" do
  version "0.1.0"
  sha256 "0b650aea48a45f0951abf564be4b1c2750a897412ce4768dbbe90172525fdd3a"

  url "https://github.com/armcknight/homebrew-tools/releases/download/work-#{version}/work-#{version}-aarch64-apple-darwin.tar.gz"
  name "work (release candidate)"
  desc "Worktree, tmux session, and Coder workspace manager (RC channel)"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  conflicts_with cask: "armcknight/tools/work"

  binary "work"

  zap trash: "~/.config/work"
end
