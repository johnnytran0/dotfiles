all:
	ansible-playbook ansible/dotfiles.yml

clean:
	rm -rf /tmp/tmux*

find:
	find ~ -maxdepth 1 -name ".*" -type l -ls

force:
	ansible-playbook ansible/dotfiles.yml --tags never

color:
	for i in {0..255}; do printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo ; fi ; done

benchmark:
	for i in $$(seq 1 10); do /usr/bin/time zsh -i -c exit; done
