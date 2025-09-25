#!/bin/bash

OLD_FILE_LIST=(
	".gitconfig"
	".ssh"
	".tmux.conf"
	".config/sway"
	".config/nvim"
	".config/fish"
	".config/fuzzel"
	".config/ghostty"
	".config/tmux"
)

PACKAGES=(
	"nvim"
	"ttf-0xproto-nerd"
	"fish"
	"flutter"
	"tmux"
	"git"
	"ghostty"
	"ssh"
	"sway"
	"waybar"
	"bat"
)

# Install packages
pacman -Syu --needed "${PACKAGES[@]}"

# If files already exist, rename to backup
for config in "${OLD_FILE_LIST[@]}"; do
	# check for file or dir existence
	if [[ -e "$HOME/$config" ]]; then
		# check if there is a symlink
		if [[ -L "$HOME/$config" ]]; then
			echo "Symlink present at $HOME/$config, removing it."
			rm -rf "$HOME/$config"
		fi
		# check if there already is a backup
		if [[ -e "$HOME/$config.bak" ]]; then
			rm -rf "$HOME/$config.bak"
		fi

		echo "Backing up $HOME/$config -> $HOME/$config.bak"
		mv "$HOME/$config" "$HOME/$config.bak"
	fi
done

# Create the symlinks 
for dir in */; do
	# follow the pattern of .git & install.sh to exclude them from stow
	case "$dir" in
		.git/) continue ;;
		install.sh/) continue ;;
		scripts/) continue ;;
		*) stow --target=$HOME "$dir" ;;
	esac
done



