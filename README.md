# dotfiles

Small macOS-only dotfiles for:

* zsh with vi-mode keybinds
* a lightweight Git prompt
* right-side current path prompt
* zsh syntax highlighting through Homebrew
* Neovim config under `~/.config/nvim`
* mise for project-local tools and environment variables

## Install

Install [Homebrew](https://brew.sh), then run:

```sh
./install.sh
```

Or run the steps yourself:

```sh
brew bundle
./bin/stow
make shell
```

`make shell` uses the first `zsh` on your `PATH`. If that is Homebrew zsh,
macOS requires the full path to be listed in `/etc/shells` before `chsh` will
accept it.

## Notes

zsh is still the best default fit here because it is the macOS default shell,
supports the right prompt natively, and keeps shell scripting behavior familiar.
Fish is excellent interactively, but switching would mean rewriting shell config
and accepting different scripting semantics for little benefit in this setup.

## Secrets

Do not put plaintext secrets in this repo.

For machine-local secrets, create `~/.zshrc.local`:

```sh
export AWS_PROFILE=personal
export SOME_API_KEY=...
export MISE_SOPS_AGE_KEY_FILE="$HOME/.config/mise/age.txt"
```

For project-local secrets, prefer `mise.toml` plus an untracked
`mise.local.toml`, or an encrypted env file:

```toml
[env]
_.file = { path = ".env.json", redact = true }
```

mise can decrypt sops/age-encrypted `.env.json`, `.env.yaml`, and `.env.toml`
files when the age key is available.

## Neovim

Neovim uses Treesitter for syntax highlighting and LSP servers for IDE-like
features. This config installs `nvim-lspconfig` and `nvim-treesitter` through
Neovim's built-in `vim.pack`.

The Brewfile installs language servers for:

* Go: `gopls`
* TypeScript/React/CDK: `typescript-language-server`
* Python: `pyright`
* Protobuf: `buf`

The first Neovim launch may install plugins and Treesitter parsers. To refresh
later, run `:lua vim.pack.update()` and `:TSUpdate`.
