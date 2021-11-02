# --dirsfirst : list directories before files
# -C          : colorized output
# -A          : use ASCII characters for indent structure
function tl
  tree --dirsfirst -C -A $argv
end
