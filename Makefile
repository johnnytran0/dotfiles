all:
	ansible-playbook ansible/dotfiles.yml


never:
	ansible-playbook ansible/dotfiles.yml --tags never