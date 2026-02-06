export alias fpk = flatpak
export alias q = exit
export alias y = yes
# List and sort by size and print
export def lsd [] { ls -da | sort-by size | print }
# List and sort by size
export def lss [] { ls -da | sort-by size }
# List and sort by modified
export def lst [] { ls -a | sort-by modified | print }

export alias pod = podman
export alias podc = podman-compose
export alias ipd = ip addr show
export alias fwd = sudo firewall-cmd
export alias pxc = proxychains -q

# List only files or directories larger than 1GB
export def dug [] { ls -da | sort-by size | where size > 1GB }

