# armcknight/homebrew-tools

Personal Homebrew tap for [armcknight](https://github.com/armcknight)'s closed-source tools. Hosts both the cask formulas and the prebuilt binary release artifacts that those casks point at — sources for each tool live in their own private repos.

## Casks

Each tool ships in two channels: `<name>` for stable releases and `<name>-rc` for release candidates. The two channels of the same tool conflict with each other (you can only install one at a time per tool).

| Cask | Channel | Source |
|------|---------|--------|
| `tools` | stable | `armcknight/tools` (private) |
| `tools-rc` | release candidate | `armcknight/tools` |
| `work` | stable | `armcknight/workr` (private) |
| `work-rc` | release candidate | `armcknight/workr` |

`tools` bundles 13 developer CLIs (`changetag`, `vrsn`, `prepare-release`, `xcbs`, `psst`, `inject-git-info`, `upload-symbols`, `tag-icons`, `ota-publish`, `spm-acknowledgements`, …). `work` is the worktree / tmux / Coder workspace manager.

## Install

```
brew tap armcknight/tools
brew trust armcknight/tools   # third-party taps require explicit trust

# Stable channel
brew install --cask armcknight/tools/tools
brew install --cask armcknight/tools/work

# Release-candidate channel (opt-in)
brew install --cask armcknight/tools/tools-rc
brew install --cask armcknight/tools/work-rc
```

All four are Apple Silicon only (`aarch64-apple-darwin`).

`brew trust armcknight/tools` covers every current and future cask in this tap. If you'd rather scope tighter, `brew trust --cask armcknight/tools/<cask>` works per-cask. (Without trust, casks that declare `conflicts_with` against another cask in the tap will fail to install — brew has to load the conflicting cask to verify, and the load is gated on trust.)

## How releases get here

Each source repo runs a `release` GitHub Actions workflow on every version tag. That workflow:

1. Builds the binary (`swift build -c release` for `tools`, `cargo build --release` for `workr`)
2. Tarballs it as `<cask>-<version>-aarch64-apple-darwin.tar.gz`
3. Uses a fine-grained PAT (`TAP_RELEASE_TOKEN`) to create a release on this repo named `<cask>-<version>` and attach the tarball
4. Clones this repo, sed-bumps the matching cask file (version + sha256), commits, pushes:
   - tag `X.Y.Z` → `Casks/<cask>.rb` (stable channel)
   - tag `X.Y.Z-rc.N` → `Casks/<cask>-rc.rb` (RC channel)

So this repo's commit history is mostly automated cask bumps from the workflows.

## Repo layout

```
.
├── Casks/
│   ├── tools.rb       # tools — stable channel
│   ├── tools-rc.rb    # tools — release-candidate channel
│   ├── work.rb        # work — stable channel
│   └── work-rc.rb     # work — release-candidate channel
└── README.md
```

## License

License terms pending — repo is public so the cask formulas can be tapped, but the binaries they reference are licensed by each source repo. A `LICENSE` file will be added once the source-side licenses are picked.
