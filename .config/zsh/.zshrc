# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# `znap install` adds new commands and completions.
znap source zsh-users/zsh-completions 
znap source zsh-users/zsh-autosuggestions 
znap source zsh-users/zsh-history-substring-search 
znap source zsh-users/zsh-syntax-highlighting
znap install asdf-vm/asdf
znap source asdf-vm/asdf

znap eval starship 'starship init zsh'
znap prompt

eval "$(zoxide init zsh)"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/var/home/arnost/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias n='nvim'
alias t='lazygit'

# pnpm
export PNPM_HOME="/var/home/arnost/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
