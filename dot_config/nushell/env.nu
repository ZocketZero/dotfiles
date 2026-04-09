$env.PATH = ($env.PATH | append [
  ($env.HOME |path join .cargo bin)
  ($env.HOME |path join .local bin)
  ($env.HOME |path join bin)
])

$env.XDG_RUNTIME_DIR = $"/run/user/(id -u | str trim)"

# create cache dir
if not ($nu.cache-dir | path exists) {
  mkdir $nu.cache-dir
}
if not ($"($nu.default-config-dir)/nu.d" |path exists) {
  mkdir $"($nu.default-config-dir)/nu.d"
}

source $"($nu.default-config-dir)/init.nu"

# generate script to run all files in nu.d
if not ($"($nu.cache-dir)/list.nu" | path exists ) {
  "" | save -f $"($nu.cache-dir)/list.nu"
}
let list = (ls $"($nu.default-config-dir)/nu.d" | get name | sort)
if not ($"($nu.cache-dir)/list.json" | path exists )  or not ($list == (open $"($nu.cache-dir)/list.json")) {
  $list | to json | save -f $"($nu.cache-dir)/list.json"
  "" | save -f $"($nu.cache-dir)/list.nu"
  $list | each {|f| $" source ($f)\n" | save --append $"($nu.cache-dir)/list.nu" } o> /dev/null
}
