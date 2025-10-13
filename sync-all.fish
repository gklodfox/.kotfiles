#!/usr/bin/env fish

cd ~/.kotfiles
for dir in fox-*-*
        cd ~/.kotfiles/$dir
        echo "UPDATE: $PWD"
	git pull --rebase
        git add .
        git commit -m "sync" --allow-empty
        git push
end
