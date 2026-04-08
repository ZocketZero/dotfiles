use modules *

$env.config = {
  show_banner: false
  completions: {
    algorithm: "prefix"
  }
}

$env.PATH = ($env.PATH | append [
  ($env.HOME |path join .cargo bin)
  ($env.HOME |path join .local bin)
  ($env.HOME |path join bin)
])

# create cache dir
if ($"($nu.cache-dir)" | path exists ) {
  mkdir $"($nu.cache-dir)"
}

# activate mise
source utils/mise_activate.nu

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
if (which carapace | is-not-empty ) {
  carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
} else if (mise exec -- carapace | complete ).exit_code == 0 {
  mise exec -- carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
}

if ($"($nu.cache-dir)/carapace.nu" | path exists ) {
  echo 'activated carapace'
  source $"($nu.cache-dir)/carapace.nu"
}
