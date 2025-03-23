### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
	command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
	command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
		print -P "%F{33} %F{34}Installation successful.%f%b" || \
		print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
	zdharma-continuum/zinit-annex-as-monitor \
	zdharma-continuum/zinit-annex-bin-gem-node \
	zdharma-continuum/zinit-annex-patch-dl \
	zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zinit ice silent wait'!0' 
zinit light hlissner/zsh-autopair
zinit ice silent wait'!0' 
zinit light MichaelAquilina/zsh-you-should-use
#zinit ice silent wait'!0' 
#zinit light zsh-users/zsh-syntax-highlighting
#zinit ice silent wait'!0' atload"zicompinit; zicdreplay"
zinit light zsh-users/zsh-completions
zinit light jeffreytse/zsh-vi-mode
zinit ice silent wait'!0' 
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice silent wait'!0' 
zinit light atuinsh/atuin


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

zinit wait lucid atload'_zsh_autosuggest_start; unalias zi' light-mode for \
    zsh-users/zsh-autosuggestions
# A.
setopt promptsubst

zinit wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZL::completion.zsh \


# Path to your Oh My Zsh installation.
#export ZSH="$HOME/.config/.oh-my-zsh"
USER_DEVICE_TYPE="THINKPAD"
#autoload -Uz compinit && compinit
autoload -Uz compinit
if [[ -n "$HOME/.zcompdump" && (! -s "$HOME/.zcompdump" || "$HOME/.zcompdump" -ot "$HOME/.zshrc") ]]; then
    compinit
else
    compinit -C  # Use caching
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

HIST_STAMPS="dd.mm.yyyy"
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt INC_APPEND_HISTORY      # Add commands to history immediately
setopt SHARE_HISTORY           # Share history across sessions
setopt HIST_IGNORE_ALL_DUPS    # Ignore duplicate commands in history
setopt HIST_EXPIRE_DUPS_FIRST  # R



#source /usr/share/zsh-antidote/antidote.zsh
#antidote load ~/.config/zshConfig/.zsh_plugins.txt
#source ~/.config/zshConfig/.zsh_plugins.zsh

#
#
source ~/.config/zshConfig/options.sh
source ~/.config/zshConfig/zoxide.sh
source ~/.config/zshConfig/yazi.sh
source ~/.config/zshConfig/functions.sh
source ~/.config/zshConfig/exports.sh
source ~/.config/.secrets.sh
source ~/.config/zshConfig/aliases.sh
source ~/.config/zshConfig/theme.zsh


# Enable extended globbing and better autocompletion
setopt extendedglob
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[-_]=**' 'l:|=* r:|=*'



#. "$HOME/.local/bin/env"

eval "$(uv generate-shell-completion zsh)"
unsetopt AUTO_CD

unset EZA_CONFIG_DIR
export MCFLY_FUZZY=2

# Ensure McFly runs properly after zsh-vi-mode initializes
#zvm_after_init_commands+=(eval "$(mcfly init zsh)")
export ATUIN_NOBIND="true"
zvm_after_init_commands+=(eval "$(atuin init zsh )")
zvm_after_init_commands+=('bindkey "^r" atuin-search')

