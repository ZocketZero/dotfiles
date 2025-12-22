# common commands.
export alias fpk = flatpak
export alias q = exit
export alias y = yes
export def lsd [] { ls -da | sort-by size | print }
export def lst [] { ls -a | sort-by modified | print }

# Shorter commands for any program.
export alias pod = podman
export alias podc = podman-compose
export alias ipd = ip addr show
export alias fwd = sudo firewall-cmd
export alias pxc = proxychains -q

# Disk utils
export def dug [] { ls -da | sort-by size | where size > 1GB }

