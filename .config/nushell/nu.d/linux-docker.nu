def vm [
  image: string@"vm ls-keys",
  --name: string = ""
  -v # mount current path to container
] {
  let vm_command = vm runner; 

  let image_name = if ($name |str length ) > 0 {
    $name
  } else {
    $"($image)(random int ..100)"
  }

  let image: string = (
    vm ls | where key == $image |
    if ($in | is-not-empty)
      { $in.image |to text| str trim }
    else {
      if (input $"Are you sure to run \"($image)\" \(y/N\)?" | str downcase) == "y" { $image } else {print "Canceled"; return} })

  if $v {
    ^$vm_command run -it --rm --network=host -v $"(pwd):/mnt" --entrypoint /bin/sh --name $image_name $image
  } else {
    ^$vm_command run -it --rm --network=host --name $image_name --entrypoint /bin/sh $image
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
    alma: "almalinux"
    opensuse :  "opensuse/leap"
  } | transpose key image
}

# list key of images list
def "vm ls-keys" [] {
    vm ls | get key
}

def "vm runner" [] {
  if (which podman | is-not-empty ) {
    "podman"
  } else {
    "docker"
  }
}

