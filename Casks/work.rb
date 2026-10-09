cask "work" do
  version "1.1.0"
  sha256 "209f09bc1e0d8d9a510969480981fcfe65e465a813cdd8b6c90e5c2495db3136"

  url "https://github.com/armcknight/homebrew-tools/releases/download/work-#{version}/work-#{version}-aarch64-apple-darwin.tar.gz"
  name "work"
  desc "Worktree, tmux session, and Coder workspace manager"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  binary "work"

  zap trash: "~/.config/work"
end
