# generate mise activate to nu.d directory
def setup-mise [] {
  if (which mise | is-not-empty ) {
    mise activate nu | save --force $"($nu.default-config-dir)/nu.d/mise.nu"
  } else {
    print 'mise command not found'
  }
}

# generate carapace script to nu.d directory
def setup-carapace [] {
  mkdir $"($nu.cache-dir)"

  # generate carapace
  if (which carapace | is-not-empty ) {
    carapace _carapace nushell | save --force $"($nu.default-config-dir)/nu.d/carapace.nu"
  } else if (which mise | is-not-empty )  and (mise exec -- carapace | complete ).exit_code == 0 {
    mise exec -- carapace _carapace nushell | save --force $"($nu.default-config-dir)/nu.d/carapace.nu"
  }

}

