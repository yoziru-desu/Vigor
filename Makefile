install:
	git submodule update --init --recursive --rebase
	ln -s ~/.vim/vimrc ~/.vimrc
	cd bundle/vimproc && make

update:
	git submodule sync
	git submodule update --init --recursive --rebase
	cd bundle/vimproc && make

rm-bundle:
	git submodule deinit -f $(BUNDLE)
	git rm -f $(BUNDLE)


base-build:
	rm -rf base/sections
	cp -R sections base/sections
	docker build -t arnau/vigor:base -f base/Dockerfile base
