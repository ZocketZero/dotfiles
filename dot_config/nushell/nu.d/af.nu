# Open a file in current directory and subdirectories randomly.
def af [
  filter: string = ""
  -n # dont automatic open file
] {
  if ($filter | str length ) > 0 {
    libaf_ls  |where name =~ $"\(?i\).\(($filter)\)$" | libaf_random_open $n
  } else {
    libaf_ls  | libaf_random_open $n
  }
}

#  Print extension stat
def "af ext" [
  extension: string@libaf_get_file_extensions=""
  -n # dont automatic open file
] {
  if ($extension | is-empty ) {
  libaf_ls | get name | path parse|get extension|uniq --count | where { $in.value | is-not-empty }| sort-by count
  } else {
    libaf_ls|where name =~ $"\(?i\).\(($extension)\)$" | libaf_random_open $n
  }
}

# print amount of files in directories
def "af dir" [] {
  ls | where type == dir |get name| each { { name: $in count: (glob ($in | path join **) | length ) }  } | sort-by count
}

# List all files with specific extension
def "af list" [
  extension: string@libaf_get_file_extensions
  -t # using file type instead of extension
] {
  libaf_ls| if $t { where type =~ $"($extension)" } else { where name =~ $"\(?i\).\(($extension)\)$" }
}

# Open a image randomly from current directory and subdirectories randomly.
def "af image" [
  -n # dont automatic open file
] {
  libaf_type image | libaf_random_open $n
}

# Open a video randomly from current directory and subdirectories randomly.
def "af video" [
  -n # dont automatic open file
] {
  libaf_type video | libaf_random_open $n
}

# Open a pdf file randomly from current directory and subdirectories randomly.
def "af pdf" [
  -n # dont automatic open file
] {
  libaf_type pdf | libaf_random_open $n
}

# Open a text file randomly from current directory and subdirectories randomly.
def "af text" [
  -n # dont automatic open file
  ] {
  libaf_type text | libaf_random_open $n
}

# includes images and videos
def "af media" [
  -n # dont automatic open file
] {
  libaf_type media | libaf_random_open $n
}


def libaf_random_open [dont_open: bool] {
  if not ($in | is-empty ) {
    $in | shuffle|first| do {  if not $dont_open { start $in.name; }; echo $in.name }
  } else {
    print "not found any file"
  }
}

def libaf_type [type: string] {
  if $type == "media" {
    libaf_ls | where type =~ "video|image"
  } else {
    libaf_ls | where type =~ $type
  }
}

def libaf_get_file_extensions [] {
  libaf_ls | get name| path parse|get extension|uniq
}

# using do -i to preven from file that we have no permission to access which can cause ls error.
def libaf_ls [] {
  do  -i { ls **/* -m } | where { $in | is-not-empty } | where type != dir and type != symlink
}
