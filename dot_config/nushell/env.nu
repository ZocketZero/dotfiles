$env.PATH = ($env.PATH | append [
  ($env.HOME |path join .cargo bin)
  ($env.HOME |path join .local bin)
  ($env.HOME |path join bin)
])

use init.nu *

create-dummy-file 
setup-mise 
setup-carapace 
