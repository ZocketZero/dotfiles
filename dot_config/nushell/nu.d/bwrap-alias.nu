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
    bwrap --ro-bind / /
    --dev-bind /dev /dev
    --proc /proc
    --ro-bind /etc /etc
    --bind $"($env.HOME)" $"($env.HOME)"
    --tmpfs /tmp
    --tmpfs $"($env.HOME)/.config/mozilla"
    --tmpfs $"($env.HOME)/.ssh"
    --tmpfs $"($env.HOME)/Documents"
    /usr/bin/nu
  )


}
