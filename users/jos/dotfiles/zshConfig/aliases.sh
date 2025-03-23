alias n='nvim'
alias nzsh='nvim ~/.dotfiles/fullConfig/shell/zshConfig/.zshrc'
alias py='python3'
alias ls='eza --icons'
alias btw='neofetch'

alias poweroff='cat /home/sebastian/assets/hanging.txt && /home/sebastian/.config/tmux/plugins/tmux-resurrect/scripts/save.sh && poweroff'
alias shutdown='/home/sebastian/.config/tmux/plugins/tmux-resurrect/scripts/save.sh && shutdown'
alias reboot='/home/sebastian/.config/tmux/plugins/tmux-resurrect/scripts/save.sh && reboot'
alias addtopath='echo "export PATH=\"$(pwd):\$PATH\"" >> ~/dotfiles/fullConfig/shell/zshConfig/exports.sh'


alias bat="bat --theme gruvbox-dark"

if [[ $USER_DEVICE_TYPE == "MAC" ]]; then

	alias tmux='tmux -f ~/.config/tmux/tmux.conf'
	alias copyfile='~/.config/scripts/copyfile.sh'
	alias changewallpaper='~/.config/scripts/change_wallpaper.sh'
	alias turkey='~/.config/scripts/coldturkey.sh'
	alias movscreenshot='~/.config/scripts/movscreenshot.sh'
	alias movscreenshotpwd='movscreenshot 600 "$(pwd)"'
	alias gprog="/Users/jo-sebastian-salte-tinderholt/Desktop/Programmering"
	alias links="~/.config/scripts/openlinksheet.sh"
	alias vmlogin="~/.config/scripts/linuxLoginScript.sh"
	alias mkignore="python3 ~/.config/scripts/mkignore.py"
	alias randomwallpaper="~/.config/scripts/randomwallpaper.sh"
	alias movfile="~/.config/scripts/movfile.sh"
	alias movfilepwd='~/.config/scripts/movfile.sh 600 "$(pwd)"'
	# bindkey -v
	alias oo="cd '/Users/jo-sebastian-salte-tinderholt/Documents/Obsidian Vault'"
	alias cal='~/Desktop/Programmering/cliCalender/calNow.py'
	# Add to .zshrc
	alias calcal='/Users/jo-sebastian-salte-tinderholt/Desktop/Programmering/calendar-skoletid-kalkulator/calcal'
	alias mknote='~/.config/scripts/mknotat.sh'

fi

if [[ $USER_DEVICE_TYPE == "THINKPAD" ]]; then
	alias ccopy="wl-copy"
	alias cpaste="wl-paste"
	alias open="xdg-open"
	alias cdir="pwd | ccopy"
	alias mknote="/home/sebastian/scripts/mknote.sh"
fi
