# templatr — stable channel.
#
# `version` and `sha256` are rewritten by templatr's release workflow on every
# version tag. Both must stay as double-quoted strings on a two-space-indented
# line: the workflow bumps them with `sed -E "s/^  version \".*\"$/.../"`, which
# silently matches nothing against any other shape (`:no_check`, single quotes).
#
# The values below are placeholders. Nothing is downloadable until the first
# release publishes the asset to this repo.
cask "templatr" do
  version "2.1.0"
  sha256 "41f80ba9eb225906314b31330b60186911f40820617cdcd5726ea47d3371028d"

  url "https://github.com/armcknight/homebrew-tools/releases/download/templatr-#{version}/templatr-#{version}-aarch64-apple-darwin.tar.gz"
  name "templatr"
  desc "Set a project up from its templatr components, and check what it still needs"
  homepage "https://github.com/armcknight/templatr"

  depends_on arch: :arm64

  binary "templatr"

  # The command keeps a clone of armcknight/templatr for its components,
  # fetched on each run.
  zap trash: "~/Library/Application Support/templatr"
end
