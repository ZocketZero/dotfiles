use modules *

$env.config = {
  show_banner: false
  completions: {
    algorithm: "prefix"
  }
}

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
source $"($nu.cache-dir)/mise.nu"
source $"($nu.cache-dir)/carapace.nu"
