all: init install_bundles tern ycm install_go_binaries

UNAME=$(shell uname)
VIM_DIR=$(shell pwd)
PLUGIN_DIR=$(VIM_DIR)/bundles

# YouCompleteMe resquires a build step
BUILD_YCM=$(PLUGIN_DIR)/YouCompleteMe/install.py --clang-completer --gocode-completer --tern-completer
ifneq ("$(wildcard /etc/arch-release)", "")
	# Arch linux requires this flag (and libclang to be installed locally
	BUILD_YCM += --system-libclang
endif

# We must explicitly set the shell to Bash or Vim will fail under Fish
# https://github.com/gmarik/vundle/wiki
SHELL=bash

init:
	rm -f $(HOME)/.vimrc
	ln -s $(VIM_DIR)/vimrc $(HOME)/.vimrc
	mkdir -p $(VIM_DIR)/{tmp,view,backup,session}

update: | update_bundles tern ycm

install_bundles:
	rm -f ./autoload/plug.vim
	curl -fLo ./autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall

install_go_binaries:
	vim +GoInstallBinaries +qall

update_bundles:
	vim +PlugUpdate +PlugUpgrade +qall

tern:
	cd $(PLUGIN_DIR)/tern_for_vim && npm install
	cd $(VIM_DIR)

ycm:
	$(BUILD_YCM)

.PHONY: | init install_bundles tern ycm install_go_binaries
