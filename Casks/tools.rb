cask "tools" do
  version "5.2.1"
  sha256 "b50f97ca7bf225696e7cfbcdda40763a4093e240e5314e101acd5a01a22cc930"

  url "https://github.com/armcknight/homebrew-tools/releases/download/tools-#{version}/tools-#{version}-aarch64-apple-darwin.tar.gz"
  name "tools"
  desc "Collection of developer tools for versioning, changelogs, Xcode builds, and more"
  homepage "https://github.com/armcknight/homebrew-tools"

  depends_on arch: :arm64

  binary "changetag"
  binary "check-release-ready"
  binary "inject-git-info"
  binary "md-toc"
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
  binary "xcprune"
end
