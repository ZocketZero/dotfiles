alias fpk = flatpak
alias q = exit
alias y = yes

# Git alias command
alias ga = git add
alias gd = git diff
alias gc = git commit
alias gst = git status
alias gla = git log --graph --all --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"

# Nushell
alias sb = sort-by
alias p = print

# list with permissions
def lsm [] {
  ls -l | select type mode name size
}

# List and sort by size and print
def lsd [] { ls -da | sort-by size | print }
# List and sort by size
def lss [] { ls -da | sort-by size }
# List and sort by modified
def lst [-p] { 
  if $p {
  ls -a | sort-by modified | print
  } else {
  ls -a | sort-by modified
  }
}

alias pod = podman
alias podc = podman-compose
alias ipd = ip addr show
alias fwd = sudo firewall-cmd
alias pxc = proxychains -q

# List only files or directories larger than 1GB
def dug [] { ls -da | sort-by size | where size > 1GB }

