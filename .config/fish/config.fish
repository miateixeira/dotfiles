set -xg EDITOR (type -p vim)

alias z "zathura --fork"
alias update "sudo pacman -Syyu"
alias yta "youtube-dl --extract-audio --audio-format mp3"
alias g31 "g++ -std=c++17 -Wall -Wextra -Wno-sign-compare -Werror=return-type -Wl,--rpath=/usr/lib64 -fsanitize=address -fsanitize=undefined -fsanitize=bounds -fno-omit-frame-pointer"
alias music "tmux new-session -s $fish_pid 'tmux source-file ~/.config/ncmpcpp/tsession'"


set -g theme_color_scheme terminal2
set -g theme_display_user yes

