default: $(wildcard *)

tmux.conf: ~/.tmux.conf ; cp $^ $@
i3: ~/etc/i3/config ; cp $^ $@
i3status_wrapper.py: ~/bin/i3status_wrapper.py ; cp $^ $@
vimrc: ~/etc/vimrc ; cp $^ $@
zshrc: ~/.zshrc ; cp $^ $@

.PHONY: vim-packages.txt
vim-packages.txt:
	@find ~/.vim/bundle -maxdepth 1 -mindepth 1 \
		-exec git -C {} remote -v \; \
		| grep '(fetch)' | awk '{print $$2}' > $@
