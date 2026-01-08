#!/usr/bin/ruby
installer='sudo apt install -y'

packages = [
    "git",
    "fastfetch",
    "curl",
    "wget",
    "gh",
    "glab",
    "7zip",
    "resolvconf",
    "zsh",
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
