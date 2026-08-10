cask "tools" do
  version "4.4.1"
  sha256 "7c5b99acef0c8dbd250362495375a7766a0728cd88e392f9f3b7110da922d4a7"

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
