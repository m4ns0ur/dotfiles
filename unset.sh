#!/usr/bin/env bash

# Get confirmation from the user
echo "This script will remove all symlinks created by setup.sh"
echo "Are you sure you want to continue? (y/N)"
read -r response
if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
	echo "Exiting..."
	exit 0
fi

# Finds all dotfiles in ~ folder that symlinked to this folder
declare -a FILES=$(find ~ -maxdepth 1 -type l -name ".*")
for file in ${FILES[@]}; do
	# Check if the symlink points to the current directory
	if [ "$(readlink $file)" == "$(pwd)/$(basename $file)" ]; then
		echo "Removing symlink $file"
		rm $file
	fi
done
