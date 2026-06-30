# tools — release-candidate channel.
#
# Bumped automatically by tools' release workflow on any RC tag
# (e.g. 4.3.1-rc.1). Until the first RC is published this file is pinned
# to the latest stable release.
#
# To opt into RC builds:   brew install --cask armcknight/tools/tools-rc
# To go back to stable:    brew uninstall --cask tools-rc && brew install --cask armcknight/tools/tools

cask "tools-rc" do
  version "4.3.0"
  sha256 "ac76ec3ea2c4edc13db8cd70aee9c0ac42ff40d25653ba8da486d9733482674e"

  url "https://github.com/armcknight/homebrew-tools/releases/download/tools-#{version}/tools-#{version}-aarch64-apple-darwin.tar.gz"
  name "tools (release candidate)"
  desc "Collection of developer tools for Apple platform projects (RC channel)"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  conflicts_with cask: "armcknight/tools/tools"

  binary "changetag"
  binary "inject-git-info"
  binary "migrate-changelog"
  binary "ota-publish"
  binary "prepare-github-release"
  binary "prepare-release"
  binary "psst"
  binary "read-changelog"
  binary "spm-acknowledgements"
  binary "tag-icons"
  binary "upload-symbols"
  binary "vrsn"
  binary "xcbs"
end
