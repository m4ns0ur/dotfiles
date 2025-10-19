#!/usr/bin/env bash

# Credit to https://github.com/jessfraz/dotfiles

# Load .bashrc, which loads: ~/.{path,bash_prompt,exports,aliases,functions,extra}
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/mansour/.lmstudio/bin"
# End of LM Studio CLI section

