. ~/root/bin/thisroot.sh

alias starwars='telnet towel.blinkenlights.nl'

function clock() {
    while true; do clear; echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done
}

alias music='mpd && ncmpcpp'

alias praat='/Applications/Praat.app/Contents/MacOS/Praat --run'

function bibtexall () {
  pdflatex $1.tex
  bibtex $1.aux
  pdflatex $1.tex
  pdflatex $1.tex
  open $1.pdf
}

function biblatexall () {
  latex $1
  biber $1
  latex $1
  dvipdfm $1.dvi
  open $1.pdf
}

function mcd () {
  mkdir -p $1
  cd $1
}

alias athena="ssh gteixe@adl.mit.edu"
alias athenax="ssh -Y gteixe@adl.mit.edu"
alias nuc="ssh gteixe7@18.138.7.219"
alias skullcanyon="ssh gabriel@18.111.60.30"


# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

export PATH=$PATH:~/bin

export PATH="~/Users/gabrielteixeira/htk/HTKTools:$PATH"

# added by Anaconda2 4.3.1 installer
export PATH="/Users/gabrielteixeira/anaconda2/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gabrielteixeira/google-cloud-sdk/path.bash.inc' ]; then source '/Users/gabrielteixeira/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gabrielteixeira/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/gabrielteixeira/google-cloud-sdk/completion.bash.inc'; fi

##
# Your previous /Users/gabrielteixeira/.bash_profile file was backed up as /Users/gabrielteixeira/.bash_profile.macports-saved_2017-10-31_at_21:18:04
##

# MacPorts Installer addition on 2017-10-31_at_21:18:04: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

if [ "$TERM" != screen-256color ]; then
    export TERM=xterm-256color
  fi

export CORE_NLP="/Users/gabrielteixeira/stanford-corenlp-full-2018-02-27/$CORE_NLP"
alias java8="/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home/bin/java"


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

(cat ~/.cache/wal/sequences &)
