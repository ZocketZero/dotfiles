# Open a file in current directory and subdirectories randomly.
def "af" [
  filter: string = ""
  -n # dont automatic open file
  --current-dir (-c) # random from files in current directory
] {
  if ($filter | str length ) > 0 {
libaf_ls --current-dir=$current_dir  |where name =~ $"\(?i\).\(($filter)\)$" | libaf_random_open $n
  } else {
    libaf_ls  --current-dir=$current_dir | libaf_random_open $n
  }
}

# Open a image randomly from current directory and subdirectories randomly.
def "af image" [
  -n # dont automatic open file
  --current-dir (-c) # random from files in current directory
] {
  libaf_type image --current-dir=$current_dir | libaf_random_open $n
}

# Open a video randomly from current directory and subdirectories randomly.
def "af video" [
  -n # dont automatic open file
  --current-dir (-c) # random from files in current directory
] {
  libaf_type video --current-dir=$current_dir | libaf_random_open $n
}

# Open a pdf file randomly from current directory and subdirectories randomly.
def "af pdf" [
  -n # dont automatic open file
  --current-dir (-c) # random from files in current directory
] {
  libaf_type pdf --current-dir=$current_dir | libaf_random_open $n
}

# Open a text file randomly from current directory and subdirectories randomly.
def "af text" [
  -n # dont automatic open file
  --current-dir (-c) # random from files in current directory
  ] {
  libaf_type text --current-dir=$current_dir | libaf_random_open $n
}

# includes images and videos
def "af media" [
  -n # dont automatic open file
  --current-dir (-c) # random from files in current directory
] {
  libaf_type media --current-dir=$current_dir | libaf_random_open $n
}



#  Print extension stat
def "af count ext" [
  extension: string@libaf_get_file_extensions=""
  -n # dont automatic open file
] {
  if ($extension | is-empty ) {
  libaf_ls | get name | path parse|get extension|uniq --count --ignore-case  | where { $in.value | is-not-empty }| sort-by count
  } else {
    libaf_ls|where name =~ $"\(?i\).\(($extension)\)$" | libaf_random_open $n
  }
}

# Print type list of all files in directories.
def "af count type" [] {
  libaf_get_mimtype --count | sort-by count
}

# print amount of files in directories
def "af count dir" [] {
  let result = (glob **/*);
  ls | where type == dir | each { |v|
    {
      dir: $v.name
      count: (($result| find $v.name | length ) - 1 )
    }
  } | sort-by count
}

# List all files with specific extension
def "af ls" [
  extension: string@libaf_get_file_extensions
] {
  libaf_ls|  where name =~ $"\(?i\).\(($extension)\)$" 
}

# List all files with specific type
def "af ls type" [
  mimtype: string@libaf_get_mimtype
] {
  libaf_ls | where type =~ $mimtype
}


def libaf_random_open [dont_open: bool] {
  if not ($in | is-empty ) {
    $in | shuffle|first| do {  if not $dont_open { start $in.name; }; echo $in.name }
  } else {
    print "not found any file"
  }
}

def libaf_type [
  type: string
  --current-dir (-c) # random from files in current directory
] {
  if $type == "media" {
    libaf_ls --current-dir=$current_dir | where type =~ "video|image"
  } else {
    libaf_ls --current-dir=$current_dir | where type =~ $type
  }
}

def libaf_get_file_extensions [] {
  libaf_ls | get name| path parse|get extension|uniq --ignore-case
}

# using do -i to preven from file that we have no permission to access which can cause ls error.
def libaf_ls [--current-dir] {
  do  -i { if ($current_dir ) {ls * -am }  else { ls **/* -m }} | where { $in | is-not-empty } | where type != dir and type != symlink
}

def libaf_get_mimtype [--count] {
  libaf_ls | get type| if $count { uniq --count } else { uniq }
}
