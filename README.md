# armcknight/homebrew-tools

Personal Homebrew tap for [armcknight](https://github.com/armcknight)'s closed-source tools and apps. Hosts both the cask formulas and the prebuilt release artifacts that those casks point at — sources for each one live in their own private repos.

## Casks

Command-line tools ship in two channels: `<name>` for stable releases and `<name>-rc` for release candidates. The two channels of the same tool conflict with each other (you can only install one at a time per tool). The macOS app casks are stable-only.

| Cask | Kind | Channel | Source |
|------|------|---------|--------|
| `tools` | CLIs | stable | `armcknight/tools` (private) |
| `tools-rc` | CLIs | release candidate | `armcknight/tools` |
| `work` | CLI | stable | `armcknight/workr` (private) |
| `work-rc` | CLI | release candidate | `armcknight/workr` |
| `claude-squad` | macOS app | stable | `armcknight/claude-squad` (private) |

`tools` bundles 13 developer CLIs (`changetag`, `vrsn`, `prepare-release`, `xcbs`, `psst`, `inject-git-info`, `upload-symbols`, `tag-icons`, `ota-publish`, `spm-acknowledgements`, …). `work` is the worktree / tmux / Coder workspace manager. `claude-squad` is a macOS app that tracks the state of several Claude Code sessions at once.

## Install

```
brew tap armcknight/tools
brew trust armcknight/tools   # third-party taps require explicit trust

# Stable channel
brew install --cask armcknight/tools/tools
brew install --cask armcknight/tools/work
brew install --cask armcknight/tools/claude-squad

# Release-candidate channel (opt-in, CLIs only)
brew install --cask armcknight/tools/tools-rc
brew install --cask armcknight/tools/work-rc
```

The CLI casks are Apple Silicon only (`aarch64-apple-darwin`). `claude-squad` is a universal app and needs macOS 14 Sonoma or newer.

Homebrew quarantines every cask download and a cask cannot opt out of that, so app casks here are signed with a Developer ID certificate, notarized, and stapled. That is what lets `brew install --cask claude-squad` launch without `--no-quarantine` and without a Gatekeeper warning.

`brew trust armcknight/tools` covers every current and future cask in this tap. If you'd rather scope tighter, `brew trust --cask armcknight/tools/<cask>` works per-cask. (Without trust, casks that declare `conflicts_with` against another cask in the tap will fail to install — brew has to load the conflicting cask to verify, and the load is gated on trust.)

## How releases get here

Each source repo runs a `release` GitHub Actions workflow on every version tag. The artifact lands here rather than on the source repo because release assets on a private repo need auth, and `brew` fetches a cask URL with none.

**CLI casks** (`tools`, `work`):

1. Build the binary (`swift build -c release` for `tools`, `cargo build --release` for `workr`)
2. Tarball it as `<cask>-<version>-aarch64-apple-darwin.tar.gz`
3. Use a fine-grained PAT (`TAP_RELEASE_TOKEN`) to create a release on this repo named `<cask>-<version>` and attach the tarball
4. Clone this repo, sed-bump the matching cask file (version + sha256), commit, push:
   - tag `X.Y.Z` → `Casks/<cask>.rb` (stable channel)
   - tag `X.Y.Z-rc.N` → `Casks/<cask>-rc.rb` (RC channel)

**App casks** (`claude-squad`) go through the shared `macos-cask-release.yml` reusable workflow in `armcknight/workflows`, which adds signing to the same shape: archive → Developer ID sign → notarize → staple → `ditto` zip as `<cask>-<version>.zip` → release on this repo → bump `Casks/<cask>.rb`.

Either way, this repo's commit history is mostly automated cask bumps from those workflows.

## Repo layout

```
.
├── Casks/
│   ├── claude-squad.rb # Claude Squad — macOS app
│   ├── tools.rb        # tools — stable channel
│   ├── tools-rc.rb     # tools — release-candidate channel
│   ├── work.rb         # work — stable channel
│   └── work-rc.rb      # work — release-candidate channel
└── README.md
```

## License

License terms pending — repo is public so the cask formulas can be tapped, but the binaries they reference are licensed by each source repo. A `LICENSE` file will be added once the source-side licenses are picked.
