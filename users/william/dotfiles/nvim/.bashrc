#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# 
# -----------------------------------------------------
# ML4W bashrc loader
# -----------------------------------------------------

# DON'T CHANGE THIS FILE

# You can define your custom configuration by adding
# files in ~/.config/bashrc 
# or by creating a folder ~/.config/bashrc/custom
# with copies of files from ~/.config/bashrc 
# You can also create a .bashrc_custom file in your home directory
# -----------------------------------------------------

# -----------------------------------------------------
# Load modular configarion
# -----------------------------------------------------

for f in ~/.config/bashrc/*; do 
    if [ ! -d $f ] ;then
        c=`echo $f | sed -e "s=.config/bashrc=.config/bashrc/custom="`
        [[ -f $c ]] && source $c || source $f
    fi
done

# -----------------------------------------------------
# Load single customization file (if exists)
# -----------------------------------------------------

if [ -f ~/.bashrc_custom ] ;then
    source ~/.bashrc_custom
fi




alias create-next='function _create_next() { npx create-next-app@latest "$1" && cd "$1" && npm run dev; }; _create_next'

alias ea='WINEPREFIX=~/.wine-ea wine "/home/william/.wine-ea/drive_c/Program Files/Sparx Systems/EA/EA.exe"'

alias n='nvim'

prisma_migrate() {
  if [ -z "$1" ]; then
    echo "Usage: prisma_migrate <name>"
    return 1
  fi
  npx prisma migrate dev --name "$1"
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

cppbuild() {
    if [[ -z "$1" ]]; then
        echo "Bruk: cppbuild <filnavn>"
        return 1
    fi

    filename=$(basename "$1" | sed 's/\..*$//') # Hent filnavnet uten endelsen
    g++ -std=c++17 -Wall "$1" -o "$filename" && ./"$filename"
}

export PATH="/usr/lib/rstudio:$PATH"


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(zoxide init bash)"
set -o vi

alias cd="z"



export ANDROID_HOME=/home/william/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

alias findf="fzf"
alias tmux="t"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"



export DOTNET_ROOT=$HOME/dotnet
export PATH=$HOME/dotnet:$PATH

