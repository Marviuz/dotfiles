#!/bin/sh

sudo pacman -S --needed git base-devel yay

# Packages I thought I needed via the ff. commands
# pacman -Qeq > pkglist.txt
# pacman -Qmq > foreignpkglist.txt

PKGS=(
  alacritty
  alsa-firmware
  alsa-oss
  alsa-plugins
  alsa-utils
  awww
  chromium
  cliphist
  dmenu
  downgrade
  eza
  fastfetch
  fd
  fnm
  fzf
  ghostty
  gimp
  hyprland
  hyprlock
  hyprpaper
  hyprpolkitagent
  hyprshot
  localsend-bin
  luarocks
  ly
  matugen-bin
  mise
  mission-center
  network-manager-applet
  networkmanager
  noto-fonts
  noto-fonts-cjk
  noto-fonts-extra
  nvidia-open
  nvidia-open-lts
  nvidia-utils
  nwg-look
  opencode-bin
  pavucontrol
  pipewire-alsa
  pipewire-jack
  pipewire-pulse
  ripgrep
  ruby-fusuma
  rustup
  starship
  stow
  swaync
  swayosd-git
  tree-sitter-cli
  ttf-jetbrains-mono-nerd
  waybar-git
  wayfreeze-git
  wezterm
  wf-recorder
  wl-clip-persist
  wl-clipboard
  wofi-emoji
  xclip
  xdg-desktop-portal-hyprland
  zen-browser-bin
  zoxide
  zsh
  zsh-autocomplete-git
  zsh-history-substring-search
)

yay -S --needed --noconfirm --sudoloop "${PKGS[@]}"

mise use --global neovim@0.12

sudo systemctl enable --now ly@tty2.service
