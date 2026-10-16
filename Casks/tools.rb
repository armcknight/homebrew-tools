cask "tools" do
  version "5.0.0"
  sha256 "8c1345f259f2e7cc780164ecb547f3fcdfda0e078bec5f39bdfd6bc69f1686a1"

  url "https://github.com/armcknight/homebrew-tools/releases/download/tools-#{version}/tools-#{version}-aarch64-apple-darwin.tar.gz"
  name "tools"
  desc "Collection of developer tools for versioning, changelogs, Xcode builds, and more"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

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
