#!/usr/bin/env zsh

#${BASH_SOURCE[0]} equivalent in zsh is ${(%):-%N}
SOURCE="(%):-%x"

cd "$(dirname "${SOURCE}")";

git pull origin develop;

function doIt() {
	rsync --exclude ".git/" \
		--exclude "bootstrap.sh" \
		-avh --no-perms . ~;
	source ~/.zprofile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
