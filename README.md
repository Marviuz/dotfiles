# dotfiles

Powershell:

```
New-Item -ItemType SymbolicLink -Path "C:\Users\<USER>\AppData\Local\<DIRECTORY>" -Target "E:\.dotfiles\<DIRECTORY>"
```

_Note: Also create symlink for `nvim-data`_

## My NVIM config

Run [Packer's quickstart](https://github.com/wbthomason/packer.nvim#quickstart)

```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
