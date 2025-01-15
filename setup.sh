#!/usr/bin/env bash

# Change shell to bash if it's not already
if [[ "$SHELL" != *"/bin/bash" ]]; then
	echo "Changing shell to bash"
	chsh -s /bin/bash
fi

# Source the path.sh file to make sure the PATH is set correctly
source .path

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

# Initialize and update submodules
git submodule update --init --recursive

echo "Creating symlinks for the dotfiles"
./symlink.sh

# Synchronize the .config folder
rsync -avh --progress --no-perms .config/ ~/.config/

# Ask user if they want to install .macos
echo "Do you want to install macOS settings? (y/N)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
	echo "Installing .macos"
	./.macos
fi

# Source the .bash_profile to apply the changes
source .bash_profile

echo "Please restart the shell to make sure all changes are applied"
