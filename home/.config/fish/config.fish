source ~/.asdf/asdf.fish
source ~/.homesick/repos/homeshick/homeshick.fish

if status is-interactive 
and not set -q TMUX
    exec tmux
end
clear
