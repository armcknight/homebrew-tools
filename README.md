# armcknight/homebrew-tools

Personal Homebrew tap for [armcknight](https://github.com/armcknight)'s closed-source tools. Hosts both the cask formulas and the prebuilt binary release artifacts that those casks point at — sources for each tool live in their own private repos.

## Casks

| Cask | Description | Source |
|------|-------------|--------|
| `tools` | Collection of developer tools for Apple platform projects (changetag, vrsn, prepare-release, xcbs, psst, inject-git-info, upload-symbols, tag-icons, ota-publish, spm-acknowledgements, …) | `armcknight/tools` (private) |
| `work` | Worktree, tmux session, and Coder workspace manager (Rust) | `armcknight/workr` (private) |

## Install

```
brew tap armcknight/tools
brew install --cask armcknight/tools/tools
brew install --cask armcknight/tools/work
```

Both are Apple Silicon only (`aarch64-apple-darwin`).

## How releases get here

Each source repo runs a `release` GitHub Actions workflow on every version tag. That workflow:

1. Builds the binary (`swift build -c release` for `tools`, `cargo build --release` for `workr`)
2. Tarballs it as `<cask>-<version>-aarch64-apple-darwin.tar.gz`
3. Uses a fine-grained PAT (`TAP_RELEASE_TOKEN`) to create a release on this repo named `<cask>-<version>` and attach the tarball
4. Clones this repo, sed-bumps the matching `Casks/*.rb` (version + sha256), commits, pushes

So this repo's commit history is mostly automated cask bumps from the workflows.

## Repo layout

```
.
├── Casks/
│   ├── tools.rb       # cask for the tools bundle
│   └── work.rb        # cask for the work binary
└── README.md
```

## License

License terms pending — repo is public so the cask formulas can be tapped, but the binaries they reference are licensed by each source repo. A `LICENSE` file will be added once the source-side licenses are picked.
