#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Clear out and reset PATH in case .zshrc is sourced multiple times in one session (while making changes)
# Do this before anything else so that this file can override any default settings that may be in /etc/profile
export PATH=$(env -i bash --login --norc -c 'echo $PATH')

# ENV variables
export ANSIBLE_PRIVATE_KEY_FILE=~/.ssh/id_rsa
export HOMEBREW_AUTO_UPDATE_SECS=604800
# remove username@host from t
export DISABLE_AUTO_TITLE="true"
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

# Enable plugins.
plugins=(git history kubectl history-substring-search)

. ~/.zsh/aliases.zsh
. ~/.zsh/functions.zsh

# Homebrew
# If we're on OS X and using Homebrew package manager, do some Homebrew-specific environmental tweaks
if command_exists brew; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  export PATH="/usr/local/sbin:$PATH"
else
  # M1 install
  HOMEBREW_PREFIX="/opt/homebrew"
fi

# When connecting via ssh, always [re]attach to a terminal manager
# Adapted from code found at <http://involution.com/2004/11/17/1-32/> (now offline)
if command_exists tmux && [ -z $TMUX ]; then
  if [ "$SSH_TTY" != "" -a "$TERM" -a "$TERM" != "screen" -a "$TERM" != "dumb" ]; then
    pgrep tmux
    # $? is the exit code of pgrep; 0 means there was a result (tmux is already running)
    if [ $? -eq 0 ]; then
      tmux -u attach -d
    else
      tmux -u
    fi
  fi
fi

# keybinds
# Allow history search via up/down keys.
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# fix keybinds in Pycharm terminal: https://intellij-support.jetbrains.com/hc/en-us/community/posts/115000013224/comments/360000193450
bindkey '\e\eOD' backward-word 
bindkey '\e\eOC' forward-word

# oh-my-zsh
source $ZSH/oh-my-zsh.sh
# must come after sourcing oh-my-zsh, else it is overwritten
export PROMPT='🔥%~%b%% '

# LaTeX
export TEXTLIVE_ROOT=/usr/local/texlive/2021basic/bin/universal-darwin
export PATH="$TEXTLIVE_ROOT:$PATH"

# Attempt to set up Git completion for zsh as documented inside git-completion.zsh
if [ -r "$GIT_BASH_COMPLETION_SOURCE" ] && [ -r "$GIT_ZSH_COMPLETION_SOURCE" ]; then
  zstyle ':completion:*:*:git:*' script $GIT_BASH_COMPLETION_SOURCE
  # If it doesn't already exist, create a symlink to the zsh completion file as ~/.zsh/completion/_git.
  # If the file was copied via sync_home and isn't actually a symlink, it will be replaced with a symlink.
  [ ! -h ~/.zsh/completion/_git ] && mkdir -p ~/.zsh/completion && rm -f ~/.zsh/completion/_git && ln -s $GIT_ZSH_COMPLETION_SOURCE ~/.zsh/completion/_git
  # Add the ~/.zsh/completion directory to fpath so zsh can find it.
  fpath=(~/.zsh/completion $fpath)
fi

# ZSH
# must be sourced at the end: https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [ /usr/local/bin/kubectl ];
	then source <(kubectl completion zsh);
fi

# https://gist.github.com/ctechols/ca1035271ad134841284
# https://carlosbecker.com/posts/speeding-up-zsh
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  	compinit;
else
  	compinit -C;
fi
