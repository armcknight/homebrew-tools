# tools — release-candidate channel.
#
# Bumped automatically by tools' release workflow on any RC tag
# (e.g. 4.5.1-RC1). Until the first RC is published this file is pinned
# to the latest stable release.
#
# To opt into RC builds:   brew install --cask armcknight/tools/tools-rc
# To go back to stable:    brew uninstall --cask tools-rc && brew install --cask armcknight/tools/tools

cask "tools-rc" do
  version "4.5.0"
  sha256 "85039fcc5bfdabd95649ba1f8311a1920482de2367a623a26e0e99cf86c9f1a6"

  url "https://github.com/armcknight/homebrew-tools/releases/download/tools-#{version}/tools-#{version}-aarch64-apple-darwin.tar.gz"
  name "tools (release candidate)"
  desc "Collection of developer tools for Apple platform projects (RC channel)"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  conflicts_with cask: "armcknight/tools/tools"

  binary "changetag"
  binary "check-release-ready"
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
