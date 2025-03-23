if [[ $USER_DEVICE_TYPE == "MAC" ]]; then
	cpf() {
		osascript -e "set the clipboard to (POSIX file \"$PWD/$1\")"
	}

	mvfile() {
		mv "$@" ~/movFiles/
	}

fi

	timer () {
		if [[ $# -eq 3 ]]; then
			time=$( qalc -t " (${1} * 60 ) + (${2}) + (${3}/60)")
		elif [[ $# -eq 2 ]]; then
			time=$( qalc -t " (${1}) + (${2}/60)")
		elif [[ $# -eq 1 ]]; then
			time=$1
		fi
		countdown "${time}m" && mpv --no-video --volume=50 --no-resume-playback "/home/sebastian/myMusic/SlavicSoulParty/Slavic Soul Party - NY Underground Tapes - 02 Sing Sing Čoček.wav"

	}

	dice() {
		if [[ $# -eq 6 ]]; then
			echo "1 ${1}"
			echo "2 ${2}"
			echo "3 ${3}"
			echo "4 ${4}"
			echo "5 ${5}"
			echo "6 ${6}"
			echo "7 ${1}"
			echo "8 ${2}"
			echo "9 ${3}"
			echo "10 ${4}"
			echo "11 ${5}"
			echo "12 ${6}"
			echo "13 ${1}"
			echo "14 ${2}"
			echo "15 ${3}"
			echo "16 ${4}"
			echo "17 ${5}"
			echo "18 ${6}"
			echo "19 ${1}"
			echo "20 ${2}"
		elif [[ $# -eq 5 ]]; then
			echo "1 ${1}"
			echo "2 ${2}"
			echo "3 ${3}"
			echo "4 ${4}"
			echo "5 ${5}"
			echo "6 ${1}"
			echo "7 ${2}"
			echo "8 ${3}"
			echo "9 ${4}"
			echo "10 ${5}"
			echo "11 ${1}"
			echo "12 ${2}"
			echo "13 ${3}"
			echo "14 ${4}"
			echo "15 ${5}"
			echo "15 ${5}"
			echo "16 ${1}"
			echo "17 ${2}"
			echo "18 ${3}"
			echo "19 ${4}"
			echo "20 ${5}"
		elif [[ $# -eq 4 ]]; then
			echo "1 ${1}"
			echo "2 ${2}"
			echo "3 ${3}"
			echo "4 ${4}"
			echo "5 ${1}"
			echo "6 ${2}"
			echo "7 ${3}"
			echo "8 ${4}"
			echo "9 ${1}"
			echo "10 ${2}"
			echo "11 ${3}"
			echo "12 ${4}"
			echo "13 ${1}"
			echo "14 ${2}"
			echo "15 ${3}"
			echo "16 ${4}"
			echo "17 ${1}"
			echo "18 ${2}"
			echo "19 ${3}"
			echo "20 ${4}"
		elif [[ $# -eq 3 ]]; then
			echo "1 ${1}"
			echo "2 ${2}"
			echo "3 ${3}"
			echo "4 ${1}"
			echo "5 ${2}"
			echo "6 ${3}"
			echo "7 ${1}"
			echo "8 ${2}"
			echo "9 ${3}"
			echo "10 ${1}"
			echo "11 ${2}"
			echo "12 ${3}"
			echo "13 ${1}"
			echo "14 ${2}"
			echo "15 ${3}"
			echo "16 ${1}"
			echo "17 ${2}"
			echo "18 ${3}"
			echo "19 ${1}"
			echo "20 ${2}"
		elif [[ $# -eq 2 ]]; then
			echo "1 ${1}"
			echo "2 ${2}"
			echo "3 ${1}"
			echo "4 ${2}"
			echo "5 ${1}"
			echo "6 ${2}"
			echo "7 ${1}"
			echo "8 ${2}"
			echo "9 ${1}"
			echo "10 ${2}"
			echo "11 ${1}"
			echo "12 ${2}"
			echo "13 ${1}"
			echo "14 ${2}"
			echo "15 ${1}"
			echo "16 ${2}"
			echo "17 ${1}"
			echo "18 ${2}"
			echo "19 ${1}"
			echo "20 ${2}"
		fi



	}
