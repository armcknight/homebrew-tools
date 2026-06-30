class Work < Formula
  desc "Worktree, tmux session, and Coder workspace manager"
  homepage "https://github.com/armcknight/workr"
  url "https://github.com/armcknight/workr.git", tag: "v0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/work --version")
  end
end
