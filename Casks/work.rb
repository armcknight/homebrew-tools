cask "work" do
  version "1.0.1"
  sha256 "e93468ded99c9d84a5d952b1ebe99768747704435935d6d46164bc8e0f6d6134"

  url "https://github.com/armcknight/homebrew-tools/releases/download/work-#{version}/work-#{version}-aarch64-apple-darwin.tar.gz"
  name "work"
  desc "Worktree, tmux session, and Coder workspace manager"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  binary "work"

  zap trash: "~/.config/work"
end
