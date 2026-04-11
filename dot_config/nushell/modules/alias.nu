export alias fpk = flatpak
export alias q = exit
export alias y = yes

# Git alias command
export alias ga = git add
export alias gd = git diff
export alias gc = git commit
export alias gst = git status
export alias gla = git log --graph --all --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"

# List and sort by size and print
export def lsd [] { ls -da | sort-by size | print }
# List and sort by size
export def lss [] { ls -da | sort-by size }
# List and sort by modified
export def lst [-p] { 
  if $p {
  ls -a | sort-by modified | print
  } else {
  ls -a | sort-by modified
  }
}

export alias pod = podman
export alias podc = podman-compose
export alias ipd = ip addr show
export alias fwd = sudo firewall-cmd
export alias pxc = proxychains -q

# List only files or directories larger than 1GB
export def dug [] { ls -da | sort-by size | where size > 1GB }

