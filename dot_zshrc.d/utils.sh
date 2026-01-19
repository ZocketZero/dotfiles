# common commands.
alias fpk="flatpak"
alias q="exit"
alias psn='ps -o user,pid,ni,stat,start,time,cmd'
alias y='yes'
lss() {
    if [[ "$@" == "" ]];then
        du -hd 0 * 2> /dev/null | sort -h
    else
        du -hd 0 "$@" 2> /dev/null | sort -h
    fi
}

# Shorter commands for any programs.
alias pod='podman'
alias podc='podman-compose'
alias ipd='ip addr show'
alias fwd='sudo firewall-cmd'
alias pxc='proxychains -q'

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

is_nu_exist=$(command -v nu 2> /dev/null);


lst() {
  if [[ "$is_nu_exist" != "" ]];then
    nu -c 'ls | sort-by modified | print'
  else
    ls -tr "$@"
  fi
}
# Disk utils
# using nu command for ls.
if [[ "$is_nu_exist" != "" ]];then
   lsd() {
        nu -c "ls -da | sort-by size | print"
    }
else
  lsd () {
    if [[ "$1" == "" ]]; then
      du -sh * | sort -h
    else
      du -sh $1 | sort -h
    fi
  }
fi

# alias dud='du -hd 0 '
dud() {
  if [[ "$*" == "" ]]; then
    du -hd 0 . 2>/dev/null
  else
    du -hd 0 "$@" 2>/dev/null
  fi
}

