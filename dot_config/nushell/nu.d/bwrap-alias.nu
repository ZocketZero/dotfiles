# sandbox for specific app
def bwrapd [
    ...args: string
] {
    (
    bwrap --ro-bind / /
    --dev-bind /dev /dev
    --proc /proc
    --ro-bind /etc /etc
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
def container [bin: path] {
  let container_path = $env.HOME | path join container ($bin| str replace / . -a)
  if ($container_path | path exists) {
    echo $"using ($container_path)"
  } else {
    mkdir $container_path
    echo $"create container ($container_path)"
  }
  bwrapd -- --bind $container_path ($env.HOME) $bin
}
