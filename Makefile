all:
	ansible-playbook ansible/dotfiles.yml

force:
	ansible-playbook ansible/dotfiles.yml --tags never