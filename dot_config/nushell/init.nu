export def create-dummy-file [] {
  ["mise.nu", "carapace.nu"] | each {|f| 
    let p = ($nu.cache-dir | path join $f)
    if not ($p | path exists) { "" | save $p }
  }
}
export def setup-mise [] {
  mkdir $"($nu.cache-dir)"
  if (which mise | is-not-empty ) {
    mise activate nu | save --force $"($nu.cache-dir)/mise.nu"
  }
}

export def setup-carapace [] {
  mkdir $"($nu.cache-dir)"

  # generate carapace
  if (which carapace | is-not-empty ) {
    carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
  } else if (which mise | is-not-empty )  and (mise exec -- carapace | complete ).exit_code == 0 {
    mise exec -- carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
  }

}

