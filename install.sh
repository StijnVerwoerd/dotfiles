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
	".config/nvim"

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
for package in "${PACKAGES}[@]"; do
	pacman -Syu "${package}"
done

# If files already exist, rename to backup
for config in "${OLD_FILE_LIST[@]}"; do
	# TODO: check for file or dir existence
	if [[ -e "~/${config}" ]]; then
		mv "~/${config}" "~/${config}.bak"
	fi
done



