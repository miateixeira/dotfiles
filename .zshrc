export PATH=$HOME/scripts:$PATH
export PATH=$HOME/ctags-5.8:$PATH

# Enable colors
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

setopt autocd extendedglob nomatch notify
unsetopt beep

zstyle :compinstall filename '/home/mia/.zshrc'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

## Change cursor shape for different vi modes.
#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#    echo -ne '\e[1 q'
#  elif [[ ${KEYMAP} == main ]] ||
#       [[ ${KEYMAP} == viins ]] ||
#       [[ ${KEYMAP} == '' ]] ||
#       [[ $1 = 'beam' ]]; then
#    echo -ne '\e[5 q'
#  fi
#}
#zle -N zle-keymap-select
#zle-line-init() {
#  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#  echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
  tmp="$(mktemp)"
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  fi
}
bindkey -s '^o' 'lfcd\n'

# ex = EXtractor for all kinds of archives
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz)   tar xzf $1    ;;
      *.bz2)      bunzip2 $1    ;;
      *.rar)      unrar x $1    ;;
      *.gz)       gunzip $1     ;;
      *.tar)      tar xf $1     ;;
      *.tbz2)     tar xjf $1    ;;
      *.tgz)      tar xzf $1    ;;
      *.zip)      unzip $1      ;;
      *.Z)        uncompress $1 ;;
      *.7z)       7z x $1       ;;
      *.deb)      ar x $1       ;;
      *.tar.xz)   tar xf $1     ;;
      *.tar.zst)  unzstd $1     ;;
      *)          echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Vimwiki git integration
# Use `vimwiki git [commands]` from any directory
# vimwiki () {
#   if [[ $# == 0 ]]
#   then
#     vim +'VimwikiIndex'
#   elif [[ $1 == 'git' ]]
#   then
#     git -C ~/vimwiki/ ${@:2}
#   else
#     echo '`Usage: vimwiki [git] [args ...]'
#   fi
# }

# Load aliases if existent
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# starship prompt for astronauts
export STARSHIP_CONFIG=~/.config/zsh/
eval "$(starship init zsh)"

# Load zsh-syntax-highlighting; should be last
source /usr/share/zsh/plugins/zsh-syntax/highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# neofetch --w3m $HOME/wallpapers/torice/zcyhewq.jpg

# echo "     ^^      ..                                       .."
# echo "             []                     Welcome...        []"
# echo "           .:[]:_          ^^                       ,:[]:."
# echo "         .: :[]: :-.                             ,-: :[]: :."
# echo '       .: : :[]: : :`._                       ,.`: : :[]: : :.'
# echo "     .: : : :[]: : : : :-._               _,-: : : : :[]: : : :."
# echo " _..: : : : :[]: : : : : : :-._________.-: : : : : : :[]: : : : :-._"
# echo " _:_:_:_:_:_:[]:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:[]:_:_:_:_:_:_"
# echo " !!!!!!!!!!!![]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!![]!!!!!!!!!!!!!"
# echo " ^^^^^^^^^^^^[]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^[]^^^^^^^^^^^^^"
# echo "             []                                       []"
# echo "             []       Good luck...                    []"
# echo "             []                                       []"
# echo "  ~~^-~^_~^~/  \~^-~^~_~^-~_^~-^~_^~~-^~_~^~-~_~-^~_^/  \~^-~_~^-~~-"
# echo " ~ _~~- ~^-^~-^~~- ^~_^-^~~_ -~^_ -~_-~~^- _~~_~-^_ ~^-^~~-_^-~ ~^"
# echo "    ~ ^- _~~_-  ~~ _ ~  ^~  - ~~^ _ -  ^~-  ~ _  ~~^  - ~_   - ~^_~"
# echo "      ~-  ^_  ~^ -  ^~ _ - ~^~ _   _~^~-  _ ~~^ - _ ~ - _ ~~^ -"
# echo "      .  ~^ -_ ~^^ -_ ~ _ - _ ~^~-  _~ -_   ~- _ ~^ _ -  ~ ^-"
# echo "             ~^~ - _ ^ - ~~~ _ - _ ~-^ ~ __- ~_ - ~  ~^_-"
# echo "                 ~ ~- ^~ -  ~^ -  ~ ^~ - ~~  ^~ - ~"
#


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
