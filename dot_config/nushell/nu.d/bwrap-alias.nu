# sandbox for specific app
def bwrapd [
    ...args: string
] {
    (
    bwrap --ro-bind / /
    --dev-bind /dev /dev
    --proc /proc
    --ro-bind /etc /etc
    --bind /run/user/ /run/user/
    --bind $"($env.HOME)" $"($env.HOME)"
    --tmpfs /tmp
    --tmpfs $"($env.HOME)/.config/mozilla"
    --tmpfs $"($env.HOME)/.ssh"
    --tmpfs $"($env.HOME)/.mozilla"
    --tmpfs $"($env.HOME)/Documents"
    ...$args
  )
}

# sandbox to spawn terminal
def san [ ] {
  figlet SANDBOX
  (
   bwrapd -- /usr/bin/nu
  )
}

# seperate home directory for each program
def container [...args: string,
  -c # bind current dir
  --tmp # bind tmpfs to home directory instead
  --profile (-p) = "default" # split profile for the program
] {
  mut home_path = []
  if $tmp {
    $home_path = [--tmpfs ($env.HOME)]
  } else { 
    let bin = $args | first
    let container_path = $env.HOME | path join container ($bin| str replace / . -a) | $in + ":" + $profile
    if ($container_path | path exists) {
      echo $"using ($container_path)"
    } else {
      mkdir $container_path
      echo $"create container ($container_path)"
    }
    $home_path = [--bind $container_path ($env.HOME)]
  }
  bwrapd -- ...$home_path ...(if $c { [--bind (pwd) (pwd)] })  ...$args
}
