runner=""
if command -v podman >/dev/null; then
  runner=podman
elif command -v docker >/dev/null; then
  runner=docker
fi

if [[ "$runner" == "" ]]; then
  return
fi

alias vm/archlinux='$runner run -it --rm --network=host --name archlinux archlinux'
alias vm/debian='$runner run -it --rm --network=host --name debian debian'
alias vm/kali='$runner run -it --rm --network=host --name kali kalilinux/kali-rolling'
alias vm/ubuntu='$runner run -it --rm --network=host --name ubuntu ubuntu'
alias vm/alpine='$runner run -it --rm --network=host --name alpine alpine'
alias vm/fedora='$runner run -it --rm --network=host --name fedora fedora'
