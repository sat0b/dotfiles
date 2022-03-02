current_dir = $(shell pwd)

.PHONY: mac
mac: mac/install mac/ln
	echo "TODO"

.PHONEY: mac/ln
mac/ln: ln
	# fish
	ln -sf "$(current_dir)/fish/config-mac.fish" "$(HOME)/.config/fish/config.fish"

.PHONY: ubuntu
ubuntu: ubuntu/install ubuntu/ln

.PHONY: ubuntu/install
ubuntu/install:
	sudo apt update
	# git
	sudo apt install git-lfs
	# docker
	sudo snap install docker
	# ghq
	sudo apt-get install golang-go
	go get github.com/motemen/ghq
	# fish
	./install/fish.sh
	# fzf
	sudo apt install fzf
	# nvim
	sudo snap install --beta nvim --classic
	# packer
	./install/packer.sh
	# rust
	curl https://sh.rustup.rs -sSf | sh
	# gh
	./install/gh.sh

.PHONY: ln
ln:
	# tmux
	ln -sf "$(current_dir)/tmux.conf" "$(HOME)/.tmux.conf"
	# nvim
	ln -sf $(current_dir)/nvim ~/.config/nvim
	# git
	ln -sf $(current_dir)/gitconfig ~/.gitconfig

.PHONEY: ubuntu/ln
ubuntu/ln: ln
	# fish
	ln -sf "$(current_dir)/fish/config-ubuntu.fish" "$(HOME)/.config/fish/config.fish"

