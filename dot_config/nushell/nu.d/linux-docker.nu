def vm [
  image: string@"vm ls-keys",
  -v # mount current path to container
] {
  let vm_command =  if (which podman | is-not-empty ) {
    "podman"
  } else {
    "docker"
  }

  let image = (vm ls | where key == $image ).image
  if $v {
    ^$vm_command run -it --rm --network=host -v $"(pwd):/mnt" --name ...$image ...$image
  } else {
    ^$vm_command run -it --rm --network=host --name ...$image ...$image
  }
}
# print list of images
def "vm ls" [] {
  {
    archlinux : 'archlinux'
    debian : "debian"
    kali : "kalilinux/kali-rolling"
    ubuntu  : "ubuntu"
    alpine :  "alpine"
    fedora :  "fedora"
    opensuse :  "opensuse/leap"
  } | transpose key image
}

# list key of images list
def "vm ls-keys" [] {
    vm ls | get key
}
