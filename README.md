## v0.12 config
minimal config using v0.12 features

### nix
The nix flake contains some of the dependant packages for this config. Especially important packages are installed with emerge or use flags (like rust).
So the nix flake does not contain everything needed to use this config.

### dependencies

```bash
neovim
git
fzf
ripgrep 
fd

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
