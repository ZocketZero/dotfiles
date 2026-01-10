#!/usr/bin/ruby
installer='sudo apt install -y'

packages = [
    "rustup", "golang", "vim",
    "git", "build-essential", "fd-find",
    "net-tools", "irssi", "neovim",
    "fastfetch", "curl", "wget", "vlc",
    "gh", "glab", "7zip", "resolvconf",
    "zsh", "figlet",
    # Fonts and Icons.
    "fonts-firacode",
    "fonts-thai-tlwg",
    "bibata-cursor-theme",
    "papirus-icon-theme"
]

uninstall_packages = []

for pk in packages
  is_success = system("#{installer} #{pk}")
  if not is_success
    uninstall_packages.push pk
  end
end

if uninstall_packages.length > 0
  puts "#######\nuninstalled packages"
  puts uninstall_packages
end
