# generate mise activate to nu.d directory
def "setup mise" [] {
  if (which mise | is-not-empty ) {
    mise activate nu | save --force $"($nu.default-config-dir)/nu.d/_mise.nu"
  } else {
    print 'mise command not found'
  } 
}

# install needed software by mise
def "setup mise install-needed" [] {
[usage "node@24" python deno bun rust-analyzer uv zig carapace starship] | each {mise use -g $in | complete  }
}

# generate starship script to nu.d directory
def "setup starship" [] {
  if (which starship | is-not-empty ) {
    starship init nu | save --force $"($nu.default-config-dir)/nu.d/_starship.nu"
  } else if (which mise | is-not-empty )  and (mise exec -- starship | complete ).exit_code == 0 {
    mise exec -- starship init nu | save --force $"($nu.default-config-dir)/nu.d/_starship.nu"
  } else {
    print "starship is not setup, not found starship binary"
  }

}

# generate carapace script to nu.d directory
def "setup carapace" [] {
  # generate carapace
  if (which carapace | is-not-empty ) {
    carapace _carapace nushell | save --force $"($nu.default-config-dir)/nu.d/_carapace.nu"
  } else if (which mise | is-not-empty )  and (mise exec -- carapace | complete ).exit_code == 0 {
    mise exec -- carapace _carapace nushell | save --force $"($nu.default-config-dir)/nu.d/_carapace.nu"
  } else {
    print "carapace is not setup, not found carapace binary"
  }

}

# Enable external repositories for Debian based distro with extrepo
def "setup extrepo" [] {
  if (which extrepo|length ) < 0 {
    print "extrepo is not installed."
    return;
  }
  ["mise" "breave_release" "docker-ce" "github-cli" "librewolf" "mozilla" "protonvpn" "vscode"]
  | each {mise use -g $in | complete  }

}

# Install needed packages for hyprland
def "setup hyprland" [command: string@[
  "apt"
] = "apt"] {

  if $command == "apt" {
    sudo apt install hyprland kitty waybar wofi fonts-font-awesome xdg-desktop-portal-hyprland cliphist wl-clipboard hyprland-qtutils hyprlauncher mako-notifier slurp grim
  } else {
    print $"($command) is not support"
  }
}
