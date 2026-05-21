# common commands.
alias fpk="flatpak"
alias q="exit"
alias psn='ps -o user,pid,ni,stat,start,time,cmd'
alias y='yes'
lss() {
    if [[ "$@" == "" ]];then
        du -hd 0 -- * 2> /dev/null | sort -h
    else
        du -hd 0 -- "$@" 2> /dev/null | sort -h
    fi
}

# Shorter commands for any programs.
alias pod='podman'
alias podc='podman-compose'
alias ipd='ip addr show'
alias fwd='sudo firewall-cmd'
alias pxc='proxychains -q'
alias gla='git log --graph --all --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'

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

lst() {
    ls -tr "$@"
}

# Disk utils
# using nu command for ls.
lsd () {
    if [[ "$1" == "" ]]; then
        du -sh -- * | sort -h
    else
        du -sh $1 | sort -h
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

# this command help run any command multiple times
# example: loop 10 ping 1.1.1.1 -c 1
loop () {
	for i in {1..$1}
	do
		"${@:2}"
	done
}

