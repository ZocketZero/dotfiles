# common commands.
alias fpk="flatpak"
alias q="exit"
alias psn='ps -o user,pid,ni,stat,start,time,cmd'
alias y='yes'
alias lss='ls -Ssrh'
alias lst='ls -tr'

# Shorter commands for any program.
alias pd='podman'
alias pdc='podman-compose'
alias ipd='ip addr show'
alias fwd='sudo firewall-cmd'
alias pxc='proxychains -q'

# Disk utils
alias dug='du -h * --max-depth=0 | grep -P "G\t"'
# alias dud='du -hd 0 '
dud() {
  if [[ "$*" == "" ]]; then
    du -hd 0 . 2>/dev/null
  else
    du -hd 0 "$@" 2>/dev/null
  fi
}

# Podman
lpod() {
  for i in $(podman images | grep local | awk '{print $1}'); do
    print "$i"
    if [[ "$1" == 'r' ]]; then
      echo deleting...
      podman rmi "$i"
    fi
  done
}
