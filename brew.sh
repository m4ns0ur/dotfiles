#!/usr/bin/env bash

# Credit to https://github.com/mathiasbynens/dotfiles

# Documentation for formulae is in https://formulae.brew.sh/formula/<formulae>

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install Brewfile bundle
brew bundle install

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

ln -sf "$BREW_PREFIX/bin/gsha256sum" "$BREW_PREFIX/bin/sha256sum"

# Add brew-installed bash to /etc/shells
if ! fgrep -q "$BREW_PREFIX/bin/bash" /etc/shells; then
  echo "Adding brew-installed bash to /etc/shells"
  echo "$BREW_PREFIX/bin/bash" | sudo tee -a /etc/shells
fi

# Change shell to brew-installed bash
if [[ "$SHELL" != "$BREW_PREFIX/bin/bash" ]]; then
  echo "Changing shell to brew-installed bash"
  chsh -s "$BREW_PREFIX/bin/bash"
fi

# Remove outdated versions from the cellar.
brew cleanup
