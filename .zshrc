# Credit to https://github.com/ohmyzsh/ohmyzsh

# [[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Enable kubectl autocomplete
autoload -Uz compinit && compinit
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Unset -R parameter for less
unset LESS

# HISTSIZE set in .exports
export SAVEHIST="$HISTSIZE"

# Share history between tabs
setopt inc_append_history       # write to the history file immediately, not when the shell exits
setopt share_history            # share command history data

## History command configuration
setopt extended_history         # record timestamp of command in HISTFILE
setopt hist_expire_dups_first   # delete duplications first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups         # ignore duplicated commands history list
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_verify              # show command with history expansion to user before running it
setopt hist_ignore_all_dups     # delete old recorded entry if new entry is a duplicate
setopt hist_save_no_dups        # don't write duplicate entries in the history file
# setopt bang_hist                # treat the '!' character specially during expansion
# setopt hist_find_no_dups        # do not display a line previously found
# setopt hist_reduce_blanks       # remove superfluous blanks before recording entry
# setopt hist_beep                # beep when accessing nonexistent history

# Search through history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

command -v starship &> /dev/null && eval "$(starship init zsh)"

export PEENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv &> /dev/null && eval "$(pyenv init -)"

command -v pipenv &> /dev/null && eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

command -v uv &> /dev/null && eval "$(uv generate-shell-completion zsh)"
command -v uvx &> /dev/null && eval "$(uvx --generate-shell-completion zsh)"

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

