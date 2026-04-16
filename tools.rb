class Tools < Formula
  desc "Collection of developer tools for versioning, changelogs, Xcode builds, and more"
  homepage "https://github.com/armcknight/tools"
  url "https://github.com/armcknight/tools.git", tag: "3.0.0"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    tools = %w[
      changetag
      inject-git-info
      migrate-changelog
      prepare-github-release
      prepare-release
      psst
      tag-icons
      upload-symbols
      vrsn
      xcbs
    ]
    tools.each do |t|
      bin.install ".build/release/#{t}"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vrsn --version")
  end
end
