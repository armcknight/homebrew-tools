# forgery — stable channel.
#
# `version` and `sha256` are rewritten by forgery's release workflow on every
# version tag. Both must stay as double-quoted strings on a two-space-indented
# line: the workflow bumps them with `sed -E "s/^  version \".*\"$/.../"`, which
# silently matches nothing against any other shape (`:no_check`, single quotes).
#
# The values below are placeholders. Nothing is downloadable until the first
# release publishes the asset to this repo.
cask "forgery" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/armcknight/homebrew-tools/releases/download/forgery-#{version}/forgery-#{version}-aarch64-apple-darwin.tar.gz"
  name "forgery"
  desc "Clone and sync a forge's repositories to a macOS machine"
  homepage "https://github.com/armcknight/forgery"

  depends_on arch: :arm64

  binary "forgery"
end
