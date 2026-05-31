# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). This repository contains configurations for a productive Linux environment, focusing on Zsh, Neovim, and Hyprland.

## 🚀 Quick Start

To initialize and apply these dotfiles on a new machine:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ZocketZero
```

Alternatively, if you already have `chezmoi` installed:

```bash
chezmoi init --apply ZocketZero
```

## 🛠 Core Components

### Shell & Terminal
- **Shell**: `zsh` as the primary shell, with `nushell` and `bash` also configured.
- **Framework**: [Oh My Zsh](https://ohmyz.sh/) with plugins (`zsh-completions`, `zsh-autosuggestions`, `zsh-syntax-highlighting`).
- **Prompt**: [Powerlevel10k](https://github.com/romkatv/powerlevel10k) and [Starship](https://starship.rs/).
- **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/) with custom themes.

### Text Editors
- **Neovim**: Configured with [LazyVim](https://www.lazyvim.org/) for a full-featured IDE experience.
- **Vim**: Basic configuration for quick edits.

### Desktop Environment (Wayland)
- **Window Manager**: [Hyprland](https://hyprland.org/).
- **Status Bar**: [Waybar](https://github.com/Alexays/Waybar).
- **Locker**: Hyprlock.

## 📦 Automation & Scripts

The `bin/` directory contains several utility and initialization scripts:

### Initialization Scripts
- `executable_init:apt-packages.sh`: Automates the installation of essential packages via `apt` (Rust, Go, Neovim, etc.).
- `executable_init:cloudflare-warp.sh`: Sets up Cloudflare WARP.

### Utility Scripts
- `cffmpeg`: Custom FFmpeg wrapper.
- `cpm`: Custom package management utility.
- `getl`: Utility for fetching logs or links.
- `ropen`: Script to open files/folders.

## 📂 Structure

- `dot_config/`: XDG configuration files (Hyprland, Kitty, Neovim, Starship, etc.).
- `dot_zshrc.d/`: Modular Zsh configuration files (aliases, utility functions).
- `bin/`: Custom scripts and binaries.

## ✨ Features

- **Modular Zsh**: Configuration is split into `utils.sh` and other modular scripts for better maintainability.
- **Auto-Installation**: Initialization scripts help bootstrap a new system quickly.
- **Cross-Shell Aliases**: Common aliases shared across shells.

