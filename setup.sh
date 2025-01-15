#!/usr/bin/env bash

# Change shell to bash if it's not already
if [[ "$SHELL" != *"/bin/bash" ]]; then
	echo "Changing shell to bash"
	chsh -s /bin/bash
fi

# If it's a macOS
if [ "$(uname)" == "Darwin" ]; then
	echo "macOS detected"
	# If Homebrew is not installed
	if ! command -v brew &> /dev/null; then
		echo "Installing Homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
	echo "Installing Homebrew bundle"
	./brew.sh
fi

echo "Creating symlinks for the dotfiles"
./symlink.sh

# Synchronize the .config folder
rsync -avh --progress --no-perms .config/ ~/.config/

# Ask user if they want to install .macos
echo "Do you want to install macOS settings? (y/n)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
	echo "Installing .macos"
	./.macos
fi

source ~/.bash_profile

echo "Please restart the shell to apply the changes"
