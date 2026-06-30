cask "work" do
  version "0.1.0"
  sha256 "23e3439f2dd3a5ad26958eee58f2727a42f0e7132e39250f0b454f281b829cdf"

  url "https://github.com/armcknight/homebrew-tools/releases/download/work-v#{version}/work-v#{version}-aarch64-apple-darwin.tar.gz"
  name "work"
  desc "Worktree, tmux session, and Coder workspace manager"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  binary "work"

  zap trash: "~/.config/work"
end
