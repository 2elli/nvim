## v0.12 config
minimal config using v0.12 features

### nix
The nix flake contains some of the dependant packages for this config. Some packages are not in the flake because I install them
with my host package manager (rust tools installed with use flags on gentoo).

### dependencies

```bash
neovim
git
fzf
ripgrep
fd
tree-sitter-cli

# lsp
basedpyright
ruff
clangd
lua-language-server
ocamllsp
rust_analyzer
tinymist
typescript-language-server
haskell-language-server
nil
zls

# formatters
rustfmt
fourmolu
nixfmt

# linters
typos
clangtidy
hlint
```
