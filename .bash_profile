#!/usr/bin/env bash

# Credit to https://github.com/jessfraz/dotfiles

# Load .bashrc, which loads: ~/.{path,bash_prompt,exports,aliases,functions,extra}
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/mansour/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

