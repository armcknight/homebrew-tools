cask "work" do
  version "1.2.0"
  sha256 "2d45bc506c8455eea0d35a9e4151f906f81c2c5f9ba853501dd6ed723b3f08db"

  url "https://github.com/armcknight/homebrew-tools/releases/download/work-#{version}/work-#{version}-aarch64-apple-darwin.tar.gz"
  name "work"
  desc "Worktree, tmux session, and Coder workspace manager"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  binary "work"

  zap trash: "~/.config/work"
end
