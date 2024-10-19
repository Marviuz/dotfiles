# dotfiles

Install this things first (scoop)

- scoop install
  - `gcc`
  - `make`
  - `fzf`
  - `ripgrep`
  - `fd`
  - `nvm`
    - then install node via `nvm`
  - `wezterm-nightly`
- winget
  - `winget install GlazeWM`

## To save space (fr fr it takes up space to my 250gb ssd)

### Powershell:

```
New-Item -ItemType SymbolicLink -Path "C:\Users\<USER>\AppData\Local\<DIRECTORY>" -Target "E:\dotfiles\<DIRECTORY>"
```

## Some specific config locations

```sh
# wezterm
~/.config/wezterm/wezterm.lua

# Glaze window manager
~/.glzr
```

_Note: Also create symlink for `nvim-data`_

### Linux:

```
ln -s ~/dotiles/.zshrc ~/.zshrc
```
