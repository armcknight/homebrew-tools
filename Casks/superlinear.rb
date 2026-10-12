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
  version "1.6.0"
  sha256 "4b33fa11842835a8ec9b5a785ff05ebe157829a466dd851da9e47c45d740b53b"

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
  # From 1.3.0 the daemon follows the cask by itself, with no hooks here
  # (Homebrew 7 deprecates flight blocks and sandboxes their replacements away
  # from launchd): it restarts onto an upgraded binary within a minute, and
  # removes its own agent a few minutes after the binary is uninstalled.
  caveats <<~EOS
    Register the launch agent so the daemon starts at login:
      superlinear install

    Configure it first:
      ~/.config/superlinear/config.json

    Upgrades restart the daemon, and uninstalling the cask removes the agent.
    To stop and remove the agent yourself:
      superlinear uninstall
  EOS

  zap trash: [
    "~/.config/superlinear",
    "~/.local/share/superlinear",
    "~/Library/LaunchAgents/com.armcknight.superlinear.plist",
  ]
end
