export XDG_CONFIG_HOME="$HOME/.config/"
export EZA_CONFIG_DIR=$XDG_CONFIG_HOME
export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME=gruvbox-dark
export MANWIDTH=80


if [[ $USER_DEVICE_TYPE == "MAC" ]]; then

	export DISPLAY=:0
	export PATH="$PATH:/Users/jo-sebastian-salte-tinderholt/Desktop/Programmering/calendar-skoletid-kalkulator"
	export PATH="/opt/homebrew:$PATH"
	export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"


	export PATH="/opt/homebrew/opt/qt/bin:$PATH"
	export PATH="$PATH:/Users/jo-sebastian-salte-tinderholt/.dotnet/tools"
	export PATH="/opt/homebrew/opt/dotnet@8/bin:$PATH"

	export PATH="$(brew --prefix llvm)/bin:$PATH"
fi

if [[ $USER_DEVICE_TYPE == "MAC" ]]; then
	export TERM=xterm-256color
fi

if [[ $USER_DEVICE_TYPE == "THINKPAD" ]]; then
	export PATH="$PATH:/home/sebastian/myPrograms"
	export PATH="$PATH:/home/sebastian/.local/share/gem/ruby/3.3.0/bin"
	export VCPKG_ROOT="/home/sebastian/assets/vcpkg"
	export ANDROID_HOME='/home/sebastian/Android/Sdk'

	export PATH="/home/sebastian/Android/Sdk/platform-tools:$PATH"
fi


