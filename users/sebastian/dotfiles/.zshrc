eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
alias dp="firefox https://search.nixos.org/packages"
alias n="nvim"
alias b="nvim ~/.zshrc"
alias s="source ~/.zshrc"
alias f="sudo -E nvim /home/william/nixos-dotfiles/flake.nix"
alias fgit="git reset --hard HEAD"
alias envd="docker exec -it supabase-db env"
alias ndev="nix develop ~/nixos-dotfiles/"
alias restore_git="git restore ."
alias home="sudo -E nvim /home/william/nixos-dotfiles/home.nix"
alias oc="sudo -E nvim /home/william/nixos-dotfiles/configuration.nix"
alias pack="sudo -E nvim /home/william/nixos-dotfiles/modules/packages.nix"
alias cd="z"
alias fw="sudo iptables -L -v -n"
alias tfw="sudo journalctl -k | grep 'refused connection:'"
alias disk='df -h'
alias diskbrukt="dust -d 2 /"
alias lg="lazygit"
alias rebase_main="git pull --rebase origin main"
export EDITOR="nvim"

setopt NO_BEEP


source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.nix-profile/share/zsh-vi-mode/zsh-vi-mode.zsh

autoload -U compinit && compinit

