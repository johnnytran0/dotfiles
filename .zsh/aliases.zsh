# Awesome platform-independent ls formatting
# Adapted from code found at <http://www.reddit.com/r/linux/comments/hejra/til_nifty_ls_option_for_displaying_directories/c1utfxb>
GLS_ARGS="--classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable --group-directories-first"
# alias ls="ls $GLS_ARGS"
alias ls="gls $GLS_ARGS"
# ls &> /dev/null
# if [ $? -eq  ]; then # The environment ls isn't GNU ls; we're not on Linux
#   # On OS X, use gls if it has been installed via Homebrew
#   if hash gls &> /dev/null; then
#     alias ls="gls $GLS_ARGS"
#   else
#     alias ls='ls -G' # If not, fall back to BSD ls
#   fi
# fi

# macOs
if [[ "$OSTYPE" == darwin* ]]; then
  # Short-cuts for copy-paste.
  alias c='pbcopy'
  alias p='pbpaste'

  # Remove all items safely, to Trash (`brew install trash`).
  [[ -z "$commands[trash]" ]] || alias rm='trash' 2>&1 > /dev/null

  # Sniff network info.
  alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

  # Process grep should output full paths to binaries.
  alias pgrep='pgrep -fli'
else
  # Process grep should output full paths to binaries.
  alias pgrep='pgrep -fl'
fi

# aliases
alias ~="cd ~/"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias ap=ansible-playbook
alias mem='top -o rsize'
alias c=clear
alias C='c; tmux clear-history; c;'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias chromed='chrome --auto-open-devtools-for-tabs'
alias chromei='chrome --incognito'
alias cpu='top -o cpu'
alias dc=docker-compose
alias docker_ip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias docker_host="echo $(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)"
alias g=gcloud
alias grep='grep --color'
alias json='python -m json.tool'
alias jsonv='jq empty; echo $!'
alias k=kubectl
alias lsd='ls -lah | grep "^d"'
# https://github.com/tmuxinator/tmuxinator#shorthand
alias mux=tmuxinator
alias plantuml='plantuml -X'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy | pbpaste"
alias srcz="source ~/.zshrc"

zle -N clear-buffer C
bindkey 'C-k' clear-buffer

# Mac
alias f="open -a Finder ./"
alias flushdns="sudo killall -HUP mDNSResponder"
alias lsappstore="mdfind kMDItemAppStoreHasReceipt=1"
