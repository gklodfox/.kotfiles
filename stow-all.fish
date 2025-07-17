#!/usr/bin/env fish

cd ~/.kotfiles
for dir in fox-*
	echo "-> $dir"
	stow -t ~ $dir
end
