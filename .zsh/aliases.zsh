# aliases
# usage - pass docker container name to get IP
alias ap=ansible-playbook
alias c=clear
alias dc=docker-compose
alias docker_ip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias docker_host="echo $(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

# Mac
alias f="open -a Finder ./"
alias lsappstore="mdfind kMDItemAppStoreHasReceipt=1"
alias flushdns="sudo killall -HUP mDNSResponder"
