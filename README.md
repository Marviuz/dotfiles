# dotfiles

Install this things first

- `gcc`
- `make`
- `fzf`
- `ripgrep`
- `fd`
- `nvm`
  - then install node via `nvm`

## To save space (fr fr it takes up space to my 250gb ssd)

### Powershell:

```
New-Item -ItemType SymbolicLink -Path "C:\Users\<USER>\AppData\Local\<DIRECTORY>" -Target "E:\dotfiles\<DIRECTORY>"
```

_Note: Also create symlink for `nvim-data`_

### Linux:

```
ln -s ~/dotiles/.zshrc ~/.zshrc
```
