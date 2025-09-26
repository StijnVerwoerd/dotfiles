#!/bin/bash
set -euo pipefail

OLD_FILE_LIST=(
	".gitconfig"
	".tmux.conf"
	".config/sway"
	".config/nvim"
	".config/fish"
	".config/fuzzel"
	".config/ghostty"
	".config/tmux"
	".config/waybar"
)

PACKAGES=(
	"nvim"
	"ttf-0xproto-nerd"
	"fish"
	#"flutter" TODO: make a github download list
	"tmux"
	"git"
	"ghostty"
	"sway"
	"waybar"
	"bat"
)

# Install packages
sudo pacman -S --needed "${PACKAGES[@]}"

# If files already exist, rename to backup
for config in "${OLD_FILE_LIST[@]}"; do
	# check if there is a symlink
	if [[ -L "$HOME/$config" ]]; then
		echo "Symlink present at $HOME/$config, removing it."
		unlink "$HOME/$config"
	fi

	# check for file or dir existence
	if [[ -e "$HOME/$config" ]]; then
		# check if there already is a backup
		if [[ -e "$HOME/$config.bak" ]]; then
			rm -rf "$HOME/$config.bak"
		fi

		echo "Backing up $HOME/$config -> $HOME/$config.bak"
		mv "$HOME/$config" "$HOME/$config.bak"
	fi
done

# Create the symlinks 
for pkg in configs/*/; do
    pkg=$(basename "$pkg")  # remove path and trailing slash
    stow --target="$HOME" -d configs "$pkg"
done
