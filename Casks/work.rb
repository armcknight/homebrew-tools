cask "work" do
  version "1.0.2"
  sha256 "1a0cf431cb38d2e38aa2d89a99f1aa78370bd7e6aba264b2de3ce7e81c4d6942"

  url "https://github.com/armcknight/homebrew-tools/releases/download/work-#{version}/work-#{version}-aarch64-apple-darwin.tar.gz"
  name "work"
  desc "Worktree, tmux session, and Coder workspace manager"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  binary "work"

  zap trash: "~/.config/work"
end
