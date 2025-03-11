echo "  
███████╗██╗   ██╗██████╗     ██████╗ ██╗   ██╗██████╗ ███████╗                     
██╔════╝██║   ██║██╔══██╗    ██╔══██╗██║   ██║██╔══██╗██╔════╝                     
███████╗██║   ██║██████╔╝    ██║  ██║██║   ██║██║  ██║█████╗                       
╚════██║██║   ██║██╔═══╝     ██║  ██║██║   ██║██║  ██║██╔══╝                       
███████║╚██████╔╝██║         ██████╔╝╚██████╔╝██████╔╝███████╗                     
╚══════╝ ╚═════╝ ╚═╝         ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝                     
                                                                                   
 ██████╗     ███╗   ███╗███████╗██╗   ██╗    ███╗   ██╗ ██████╗ ███╗   ███╗███████╗
██╔═══██╗    ████╗ ████║██╔════╝██║   ██║    ████╗  ██║██╔═══██╗████╗ ████║██╔════╝
██║   ██║    ██╔████╔██║█████╗  ██║   ██║    ██╔██╗ ██║██║   ██║██╔████╔██║█████╗  
██║   ██║    ██║╚██╔╝██║██╔══╝  ██║   ██║    ██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══╝  
╚██████╔╝    ██║ ╚═╝ ██║███████╗╚██████╔╝    ██║ ╚████║╚██████╔╝██║ ╚═╝ ██║███████╗
 ╚═════╝     ╚═╝     ╚═╝╚══════╝ ╚═════╝     ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
                                                                                   
███████╗    ██╗    ██╗██╗   ██╗ █████╗ ███╗   ██╗████████╗                         
██╔════╝    ██║    ██║██║   ██║██╔══██╗████╗  ██║╚══██╔══╝                         
█████╗      ██║ █╗ ██║██║   ██║███████║██╔██╗ ██║   ██║                            
██╔══╝      ██║███╗██║██║   ██║██╔══██║██║╚██╗██║   ██║                            
███████╗    ╚███╔███╔╝╚██████╔╝██║  ██║██║ ╚████║   ██║                            
╚══════╝     ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝                            
"
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

source /home/tomas/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="eza --icons=always"
alias la="eza -a --icons=always"
alias cat="batcat"
alias fd="fdfind"
alias layout="setxkbmap -layout"
alias matlab="matlab -softwareopengl"

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/omp.json)"

eval $(thefuck --alias)
