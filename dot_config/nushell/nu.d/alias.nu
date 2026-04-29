alias fpk = flatpak
alias q = exit
alias y = yes

# Git alias command
alias ga = git add
alias gd = git diff
alias gc = git commit
alias gst = git status
alias gcl = git clone --recurse-submodules
alias gp = git push
alias gla = git log --graph --all --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"

# Nushell
alias sb = sort-by
alias p = print
alias exp = explore

# list with permissions
def lsm [path: glob = .] {
  ls -l $path | select type mode user group name size
}

# list only directories
def lsd [path: glob = .] { ls -a $path | where type == dir }
# list only directories with size
def lsds [path: glob = .] { ls -ad $path | where type == dir|sort-by size }
# list only directories and print
def lsdp [path: glob = .] { lsd $path | print }

# List and sort by size
def lss [path: glob = .] { ls -da $path | sort-by size }
# List and sort by size and print
def lssp [path: glob = .] { lss $path | print }

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

