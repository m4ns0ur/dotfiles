#!/usr/bin/env bash

# Credit to https://github.com/alrra/dotfiles/blob/main/src/os/create_symbolic_links.sh

# Finds all dotfiles in this folder (except .DS_Store and .macos)
declare -a FILES=$(find . -type f -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .macos | sed 's|//|/|g' | sed 's|./.|.|')
# Add the .vim_runtime folder
FILES="$FILES .vim_runtime"

for file in ${FILES[@]}; do
    source="$(pwd)/$file"
    target="$HOME/$(printf "%s" "$file" | sed "s/.*\/\(.*\)/\1/g")"
    if [ -e "$target" ]; then
        if [ "$(readlink "$target")" != "$source" ]; then
            echo "File already exists: $target"
            echo "Do you want to overwrite it? (y/N)"
            read -r response
            if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
                rm -rf "$target"
                ln -sf $source $target
                printf "\e[0;32m[✔]\e[0m $target → $source\n"
            else
                printf "\e[0;31m[✖]\e[0m $target → $source\n"
            fi
        else
            printf "\e[0;32m[✔]\e[0m $target → $source\n"
        fi
    else
        ln -sf $source $target
        printf "\e[0;32m[✔]\e[0m $target → $source\n"
    fi
done
