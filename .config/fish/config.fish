# asdf
source ~/.asdf/asdf.fish

if status is-interactive
    and not set -q TMUX
    exec tmux
end

set -g -x EDITOR nvim
set -x GPG_TTY (tty)
set -g ANDROID_HOME $HOME/Android/Sdk

# PATH
set -x PATH $PATH $HOME/bin

# FZF

# Use ripgrep in FZF
# --files: List files that would be searched but do not search
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
set FZF_PREVIEW_OPTS '--preview "bat --style=numbers --color=always --line-range :500 {}"'
set -g FZF_DEFAULT_COMMAND "rg --files --hidden --follow --smart-case --glob '!.git/*'"
set -g FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -g FZF_DEFAULT_OPTS "$FZF_PREVIEW_OPTS"

# ALIASES
alias ls='exa -lah --icons'
alias cat='bat'
# alias ranger='lf'
alias f="fzf "$FZF_PREVIEW_OPTS""
alias suspend="systemctl suspend"
alias layout_us="setxkbmap -layout us && xmodmap ~/.Xmodmap"
alias layout_cs="setxkbmap -layout cz && xmodmap ~/.Xmodmap"

## DOCKER
# Stop/kill all running containers.
alias dockerkillall='docker kill (docker ps -q)'
# Delete stopped containers.
alias dockercleanc='printf "\n===> Deleting stopped containers\n\n" && docker rm (docker ps -a -q)'
# Delete untagged images.
alias dockercleanimages='printf "\n===> Deleting untagged images\n\n" && docker rmi (docker images --filter "dangling=true" -q --no-trunc)'
# Delete dangling volumes
alias dockercleanvolumes='printf "\n===> Deleting dangling volumes\n\n" && docker volume rm (docker volume ls -qf dangling=true)'
# Delete all untagged images and dangling volumes.
# alias dockerclean='dockercleanimages || true && dockercleanvolumes'
alias dockerclean='docker system prune'

## DOTFILES MANAGEMENT
# https://www.atlassian.com/git/tutorials/dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# ABREVATIONS

if not set -q fish_initialized
    abbr -a n nvim
    abbr -a t tig
    abbr -a m make
    abbr -a c config
    abbr -a ch cht.sh
    abbr -a y yarn
    abbr -a p pnpm

    ## git
    abbr -a g git
    abbr -a ga git add
    abbr -a gs git switch
    abbr -a gst git status
    abbr -a gc git commit
    abbr -a gl git log
    abbr -a gco git checkout
    abbr -a gd git diff
    abbr -a gr git rebase
    abbr -a gm git merge
    abbr -a gps git push
    abbr -a gpl git pull
    abbr -a gcl git clone

end

function cht.sh
    curl cheat.sh/$argv
end

complete -c cht.sh -xa '(curl -s cheat.sh/:list)'

function fish_greeting
    echo (~/.config/fish/daily-fact.fish --no-intro) | cowsay -f dragon-and-cow | lolcat
end

set -U fish_greeting

# Starship prompt
starship init fish | source
