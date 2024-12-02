ISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=10000
EDITOR=nvim
setopt extendedglob nomatch
unsetopt autocd beep notify
bindkey -e

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
alias cd="z"
alias cat="batcat"

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
