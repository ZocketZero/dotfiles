use modules *

$env.config = {
  show_banner: false
  completions: {
    algorithm: "prefix"
  }
}

source $"($nu.cache-dir)/mise.nu"

# activate mise
# mkdir $"($nu.cache-dir)"
# if not ($"($nu.cache-dir)/mise.nu" | path exists ) {
#   if (which mise | is-not-empty ) {
#     mise activate nu | save --force $"($nu.cache-dir)/mise.nu"
#   }
# }

# $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
# if ($"($nu.cache-dir)/carapace.nu" | path exists ) {
#   echo 'activated carapace'
#   source $"($nu.cache-dir)/carapace.nu"
# }


