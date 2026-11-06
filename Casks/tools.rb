cask "tools" do
  version "5.2.0"
  sha256 "28c6cb8715eb8ee66d16b290a753fd5d59d0dbb06ed7c8f6ed3c32a5df7f7428"

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
