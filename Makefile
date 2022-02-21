.PHONY: install/ubuntu
install/ubuntu:
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

