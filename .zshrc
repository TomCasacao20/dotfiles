fastfetch

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
EDITOR=nvim
unsetopt autocd beep notify
bindkey -e

if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi

source ~/.zsh-autopair/autopair.zsh
autopair-init

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

alias ls="eza --icons=always"
alias la="eza -a --icons=always"
alias cat="bat"
alias fd="fdfind"
alias layout="setxkbmap -layout"
alias matlab="matlab -softwareopengl"
alias clear="clear && fastfetch"

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:/home/tomasc/.local/bin
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/omp.json)"

eval $(thefuck --alias)

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/tomasc/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
