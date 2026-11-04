cask "work" do
  version "1.3.0"
  sha256 "8fa86b90539910bc3033e796a49ca4b16b3ef4901e17c14d89ef3e52d6017fed"

  url "https://github.com/armcknight/homebrew-tools/releases/download/work-#{version}/work-#{version}-aarch64-apple-darwin.tar.gz"
  name "work"
  desc "Worktree, tmux session, and Coder workspace manager"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  binary "work"

  zap trash: "~/.config/work"
end
