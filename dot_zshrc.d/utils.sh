# common commands.
alias fpk="flatpak"
alias q="exit"
alias psn='ps -o user,pid,ni,stat,start,time,cmd'
alias y='yes'
alias lss='ls -Ssrh'

# Shorter commands for any program.
alias pod='podman'
alias podc='podman-compose'
alias ipd='ip addr show'
alias fwd='sudo firewall-cmd'
alias pxc='proxychains -q'

is_nu_exist=$(command -v nu 2> /dev/null);


lst() {
  if [[ "$is_nu_exist" != "" ]];then
    nu -c 'ls | sort-by modified | print'
  else
    alias lst='ls -tr'
  fi
}
# Disk utils
unalias ls;
# using nu command for ls.
if [[ "$is_nu_exist" != "" ]];then
    ls() {
        ls_arg=$(echo -n $@ | sed 's#:#|#g')
        nu -c "ls $ls_arg"
    }
    lsd() {
        nu -c "ls -da | sort-by size | print"
    }
fi

dug() {
    if [[ "$is_nu_exist" != "" ]];then
        nu -c "ls -da | where size > 1GB | sort-by size | print"
    else
        du -h * --max-depth=0 | grep -P "G\t"
    fi
}
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
