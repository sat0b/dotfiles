current_dir = $(shell pwd)

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
	sudo apt install fish
	/usr/bin/fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
	/usr/bin/fish -c "fisher install decors/fish-ghq"
	# fzf
	sudo apt install fzf
	# nvim
	sudo snap install --beta nvim --classic
	# packer
	rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	# rust
	curl https://sh.rustup.rs -sSf | sh

.PHONEY: ubuntu/ln
ubuntu/ln:
	# tmux
	ln -sf "$(current_dir)/tmux.conf" "$(HOME)/.tmux.conf"
	# fish
	ln -sf "$(current_dir)/config-ubuntu.fish" "$(HOME)/.config/fish/config.fish"
	# nvim
	ln -sf $(current_dir)/nvim ~/.config/nvim
	# git
	ln -sf $(current_dir)/gitconfig ~/.gitconfig
