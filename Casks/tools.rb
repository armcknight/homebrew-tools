cask "tools" do
  version "4.4.0"
  sha256 "5e1167ad86e32d76e0431895a95f20662646dc98a4af6e48068a0a1f4ffc65fc"

  url "https://github.com/armcknight/homebrew-tools/releases/download/tools-#{version}/tools-#{version}-aarch64-apple-darwin.tar.gz"
  name "tools"
  desc "Collection of developer tools for versioning, changelogs, Xcode builds, and more"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

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
