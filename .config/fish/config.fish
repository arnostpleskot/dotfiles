# kitty
kitty + complete setup fish | source

# fnm
# set PATH /home/arnost/.fnm $PATH
fnm env | source
fnm completions | source

# PATH
# ruby
set PATH /home/arnost/.gem/ruby/2.7.0/bin $PATH

# python
# set PATH /home/arnost/.local/bin $PATH

# Fix for java apps (https://wiki.archlinux.org/index.php/Dwm#Fixing_misbehaving_Java_applications)
set -g -x _JAVA_AWT_WM_NONREPARENTING 1

set -g -x EDITOR nvim

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
alias man='batman'
alias f="fzf "$FZF_PREVIEW_OPTS""
alias ssh="TERM=xterm /usr/bin/ssh"
alias suspend="systemctl suspend"
alias layout_us="setxkbmap -layout us && xmodmap ~/.Xmodmap"
alias layout_cs="setxkbmap -layout cz && xmodmap ~/.Xmodmap"

# dotfiles management: https://www.atlassian.com/git/tutorials/dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# ABREVATIONS

if not set -q fish_initialized
  abbr -a n nvim
  abbr -a r ranger
  abbr -a t tig
  abbr -a m make

  ## git
  abbr -a g git
  abbr -a gs git status
  abbr -a gc git commit
  abbr -a gl git log
  abbr -a gco git checkout
  abbr -a gd git diff
  abbr -a gm git merge
  abbr -a gps git push
  abbr -a gpl git pull
  abbr -a c config
end

# Theme
# Set theme only for interactive terminal: https://github.com/Jomik/fish-gruvbox/issues/3#issuecomment-712656458
if status --is-interactive
  theme_gruvbox dark medium
end

# Starship prompt
starship init fish | source
