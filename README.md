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
- `cpm`: Detects the active JavaScript package manager (`npm`, `pnpm`, `bun`, or `deno`) based on lockfile presence.
- `getl`: Utility for fetching logs or links.
- `rn`: Reads from stdin and injects it at the `:in` placeholder in a command (pipe-to-arg helper).
- `ropen`: Script to open files/folders.
- `warp`: Python CLI wrapper for `warp-cli` — manage Cloudflare WARP connection modes (`doh`, `warp`, `connect`, `disconnect`, `status`).

## 📂 Structure

- `dot_config/`: XDG configuration files.
  - `hypr/`: Hyprland window manager config and Hyprlock screen locker.
  - `kitty/`: Terminal emulator themes and settings.
  - `nvim/`: Neovim / LazyVim config.
  - `nushell/`: Nushell shell config (`config.nu`, `env.nu`, `init.nu`, `ls_custom.nu`).
  - `jj/`: [Jujutsu](https://github.com/martinvonz/jj) VCS config.
  - `graftcp/`: [graftcp](https://github.com/hmgle/graftcp) proxy config.
  - `waybar/`: Wayland status bar config.
  - `starship.toml`: [Starship](https://starship.rs/) prompt configuration.
- `dot_zshrc.d/`: Modular Zsh configuration files.
  - `utils.sh`: Common aliases (`fpk`, `pod`, `pxc`, `gla`, …) and utility functions (`lss`, `lsd`, `dud`, `loop`, `lpod`).
  - `linux-docker.sh`: Dynamically registers shell functions (`vm/archlinux`, `vm/ubuntu`, `vm/kali`, …) for launching distro containers via Podman or Docker.
- `bin/`: Custom scripts and binaries.
- `dot_zshrc`: Main Zsh config — loads Oh My Zsh, Powerlevel10k, and activates [mise](https://mise.jdx.dev/) (dev tool version manager).
- `dot_bashrc`: Bash configuration.
- `dot_gitconfig`: Git configuration.
- `dot_p10k.zsh`: Powerlevel10k prompt theme settings.
- `.chezmoiexternal.toml`: Declares external dependencies (Oh My Zsh archive + plugins via git-repo).

## ✨ Features

- **Modular Zsh**: Configuration is split into `utils.sh`, `linux-docker.sh`, and other modular scripts for better maintainability.
- **Auto-Installation**: Initialization scripts help bootstrap a new system quickly.
- **Container Shortcuts**: One-command access to distro containers (`vm/ubuntu`, `vm/kali`, `vm/archlinux`, etc.) via Podman/Docker.
- **Version Manager**: [mise](https://mise.jdx.dev/) activated in Zsh for per-project tool versions.
- **Multi-Shell**: Configs for Zsh, Nushell, and Bash co-exist in the same repo.
- **LazyVim Language Support**: Enabled extras for Go, Rust, Python, TypeScript, Lua, Java, Ruby, Zig, C/C++, PHP, Scala, SQL, Markdown, Docker, Astro, Svelte, Tailwind, and more.
