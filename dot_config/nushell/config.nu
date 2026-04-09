use modules *

$env.config = {
  show_banner: false
  completions: {
    algorithm: "prefix"
  }
}

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional

source $"($nu.cache-dir)/list.nu"
