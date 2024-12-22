ISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=10000
EDITOR=nvim
setopt extendedglob nomatch
unsetopt autocd beep notify
bindkey -e

if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi

source ~/.zsh-autopair/autopair.zsh
autopair-init

source /home/tomas/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="eza --icons=always"
alias la="eza -a --icons=always"
alias gstat="git status"
alias gadd="git add"
alias cat="batcat"
alias fd="fdfind"
alias layout="setxkbmap -layout"

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/omp.json)"
