all: bundles ycm

bundles:
	vim +BundleInstall! +qall

ycm:
	./bundle/YouCompleteMe/install.py --clang-completer --gocode-completer --tern-completer
