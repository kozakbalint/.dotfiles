if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable greeting message
set fish_greeting ""

# Homebrew init
eval "$(/opt/homebrew/bin/brew shellenv)"

# Shell theme
# Requires `brew install starship`
starship init fish | source

# Aliases
# Requires `brew install exa` 
alias la="exa -l -g --icons --git --all"
alias ll="exa -l -g --icons --git"
alias llt="exa -1 --icons --tree --git-ignore"
alias dotfiles='/opt/homebrew/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Auto-switch nvm version on cd
# Requires a ~/.node-version file with a valid node version
# https://github.com/jorgebucaran/nvm.fish/pull/186
if type -q nvm
  function __nvm_auto --on-variable PWD
  nvm use --silent 2>/dev/null # Comment out the silent flag for debugging
  end
  __nvm_auto
end

# Pyenv setup
# Requires `brew install pyenv`
if type -q pyenv
  status --is-interactive; and source (pyenv init -|psub)
end

# Jenv init
# Requires `brew install jenv`
eval "$(jenv init -)"
set PATH $HOME/.jenv/bin $PATH
status --is-interactive; and jenv init - | source

# `cat` → `bat` abbreviation
# Requires `brew install bat`
if type -q bat
  abbr --add -g cat 'bat'
end
 
# `rm` → `trash` abbreviation (moves files to the trash instead of deleting them)
# Requires `brew install trash`
if type -q trash
  abbr --add -g rm 'trash'
end
