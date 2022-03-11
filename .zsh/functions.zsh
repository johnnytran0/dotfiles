# https://github.com/joshdick/dotfiles/blob/main/zsh.symlink/functions.zsh
# On Mac OS X, cd to the path of the front Finder window
# Found at <http://brettterpstra.com/2013/02/09/quick-tip-jumping-to-the-finder-location-in-terminal>
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# On Mac OS X, copies the contents of a text file to the clipboard
# Found at <http://brettterpstra.com/2013/01/15/clip-text-file-a-handy-dumb-service>
clip() {
  type=`file "$1"|grep -c text`
  if [ $type -gt 0 ]; then
    cat "$@" | pbcopy
    echo "Contents of $1 are in the clipboard."
  else
    echo "File \"$1\" is not plain text."
  fi
}

color() {
  for i in {0..255}; do  printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo ; fi ; done
}

# this should be a very portable way of checking if something is on the path
# usage: "if command_exists foo; then echo it exists; fi"
command_exists() {
  type "$1" &> /dev/null
}

# Retrieve dictionary definitions of words.
# Adapted from code found at <http://onethingwell.org/post/25644890287/a-shell-function-to-define-words>
define() {
  if [[ $# -ge 2 ]]; then
    echo "$0: too many arguments" >&2
    return 1
  else
    curl "dict://dict.org/d:$1"
  fi
}

# Execute commands for each file in current directory.
# https://stackoverflow.com/questions/10523415/execute-command-on-all-files-in-a-directory
each() {
  for i in *;
  do
    echo "${i}:"
    $@ "${i}"
  done
}

# Extracts archives
# Found at <http://pastebin.com/CTra4QTF>
extract() {
  case $@ in
    *.tar.bz2) tar -xvjf "$@"  ;;
    *.tar.gz)  tar -xvzf "$@"  ;;
    *.bz2)     bunzip2 "$@"  ;;
    *.rar)     unrar x "$@"  ;;
    *.gz)      gunzip "$@" ;;
    *.tar)     tar xf "$@" ;;
    *.tbz2)    tar -xvjf "$@"  ;;
    *.tgz)     tar -xvzf "$@"  ;;
    *.zip)     unzip "$@"    ;;
    *.xpi)     unzip "$@"    ;;
    *.Z)       uncompress "$@" ;;
    *.7z)      7z x "$@" ;;
    *.ace)     unace e "$@"  ;;
    *.arj)     arj -y e "$@" ;;
    *)         echo "'$@' cannot be extracted via $0()" ;;
  esac
}

# Search shell history
hgrep() {
  history 1 | grep $1
}

nil () {
  echo '00000000-0000-0000-0000-00000000' |
    pbcopy && pbpaste;
}

# Packs $2-$n into $1 depending on $1's extension
# Found at <http://pastebin.com/CTra4QTF>
pack() {
  if [[ $# -lt 2 ]]; then
    echo -e "\n$0() usage:"
    echo -e "\t$0 archive_file_name file1 file2 ... fileN"
    echo -e "\tcreates archive of files 1-N\n"
  else
    DEST=$1
    shift
    case $DEST in
      *.tar.bz2) tar -cvjf $DEST "$@" ;;
      *.tar.gz)  tar -cvzf $DEST "$@" ;;
      *.zip)     zip -r $DEST "$@" ;;
      *)         echo "Unknown file type - $DEST" ;;
    esac
  fi
}

# Print Bundle EXecutable
pbex () {
    # https://apple.stackexchange.com/a/334635
    # Variables
    local app_name="";
    local app_path_and_name="";
    local path_to_lsregister="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/";

    # If run without arguments, issue a usage summary and exit
    if [[ "$1" == "" ]]; then
        echo "$FUNCNAME: returns name of bundle applications’s executable file";
        echo "usage: $FUNCNAME [application name]";
        return 0;
    fi;

    # If argument doesn't end with '.app', append it
    if [[ "$1" =~ \.app$ ]]; then
        app_name="$1"
    else
        app_name="$1.app";
    fi;

    # Look for the path of the application bundle
    # Search /Applications first
    app_path_and_name="$(find /Applications -type d -name "$app_name" -maxdepth 5 | grep -m 1 "$app_name")";
    # If not found, search the LaunchServices database (this is the time-consuming step)
    test "$app_path_and_name" || app_path_and_name="$($path_to_lsregister/lsregister -dump | grep -v /Volumes | egrep --max-count 1 "/$app_name$" | sed 's:.* \(/.*\):\1:')"
    # Check if Info.plist exists and is readable
    if [[ -r "$app_path_and_name/Contents/Info.plist" ]]; then
        # Extract the CFBundleExecutable key that contains the name of the executable and print it to standard output
        echo "$app_path_and_name/MacOS/$(defaults read "$app_path_and_name/Contents/Info.plist" CFBundleExecutable)";
        return 0;
    else
        echo "Application '$1' not found";
        return 1
    fi
}

tmux_title() {
  [[ -n "$TMUX" ]] && print -Pn "\e]0;${PWD/$HOME/\~}\a"
}
# add-zsh-hook precmd tmux_title

# uuid v4 https://serverfault.com/a/799198/622085
uuid () {
	od -x /dev/urandom |
		head -1 |
		awk '{OFS="-"; srand($6); sub(/./,"4",$5); sub(/./,substr("89ab",rand()*4,1),$6); print $2$3,$4,$5,$6,$7$8$9}' |
		pbcopy && pbpaste;
}

check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    echo " %{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
  fi
}

# set RPROMT directly. Will override other functions where it gets set
RPROMPT='$(check_last_exit_code)'
