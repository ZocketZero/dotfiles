#!/usr/bin/bash

packages=(
  rustup golang vim
  git build-essential fd-find
  net-tools irssi neovim
  fastfetch curl wget vlc
  htop btop btm
  gh glab 7zip
  zsh figlet
  # Fonts and Icons.
  fonts-firacode
  fonts-thai-tlwg
  bibata-cursor-theme
  papirus-icon-theme
)

uninstall_packages=()

for pk in "${packages[@]}"; do
  if ! sudo apt install -y "$pk"; then
    uninstall_packages+=("$pk")
  fi
done

if [ ${#uninstall_packages[@]} -gt 0 ]; then
  printf '#######\nuninstalled packages\n'
  for p in "${uninstall_packages[@]}"; do
    echo " - $p"
  done
fi
