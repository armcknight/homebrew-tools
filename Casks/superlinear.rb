# superlinear — stable channel.
#
# `version` and `sha256` are rewritten by superlinear's release workflow on every
# version tag. Both must stay as double-quoted strings on a two-space-indented
# line: the workflow bumps them with `sed -E "s/^  version \".*\"$/.../"`, which
# silently matches nothing against any other shape (`:no_check`, single quotes).
#
# The values below are placeholders. Nothing is downloadable until the first
# release publishes the asset to this repo.
cask "superlinear" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/armcknight/homebrew-tools/releases/download/superlinear-#{version}/superlinear-#{version}-aarch64-apple-darwin.tar.gz"
  name "superlinear"
  desc "Daemon that turns new Linear issues into autonomous Claude Code agents"
  homepage "https://github.com/armcknight/superlinear"

  depends_on arch: :arm64

  binary "superlinear"

  # The cask installs the binary only. Homebrew has no launchd support for casks
  # — the `service` stanza installs to ~/Library/Services, which is the Services
  # menu, not an agent — so the daemon is registered by the binary itself:
  #
  #   superlinear install
  #
  # `zap` cannot undo that, since a zap runs after the binary is gone. Run
  # `superlinear uninstall` before uninstalling the cask.
  caveats <<~EOS
    Register the launch agent so the daemon starts at login:
      superlinear install

    Configure it first:
      ~/.config/superlinear/config.json

    To stop and remove the agent:
      superlinear uninstall
  EOS

  zap trash: [
    "~/.config/superlinear",
    "~/.local/share/superlinear",
    "~/Library/LaunchAgents/com.armcknight.superlinear.plist",
  ]
end
