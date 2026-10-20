# iclirius/homebrew-tap

Public Homebrew tap for Iclirius.

## Install (Apple Silicon, no source checkout)

```bash
brew tap iclirius/tap
brew trust --tap iclirius/tap
brew install iclirius/tap/iclirius
iclirius --version
```

Tap GitHub repository: `https://github.com/iclirius/homebrew-tap`  
Homebrew short name: **`iclirius/tap`** (not `iclirius/openclaw`).

Default formula installs the V1 certified candidate **1.0.0-rc.44**
(wheel SHA-256 `e1f9240290424854e9aa2ee45cee8140134c2022a2da02b8a139221a20208268`).

Pin explicitly:

```bash
brew install iclirius/tap/iclirius@1.0.0-rc44
```

## Wrong names (do not use)

- `brew tap iclirius/openclaw` → looks for `iclirius/homebrew-openclaw` (does not exist / not public)
- `brew tap iclirius/homebrew-tap` → incorrect; Homebrew already prefixes `homebrew-`
