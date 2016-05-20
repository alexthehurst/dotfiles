#!/bin/bash

# Run this script to symlink dotfiles from the repo into the home folder.

DOTFILES_DIR=~/dotfiles

# Add regex here to exclude files in the dotfiles folder from being linked.

excludes=(
	'^.$'
	'^.git$'
	'^.gitignore$'
	'^\.\.'
	'swp$'
	'~$'
)

# Compares the first argument (string) to each element of the second argument (array).
# Exits 0 if there's any match.

inRegexList () {
	local e
	for e in "${@:2}"
	do
		if [[ $1 =~ $e ]]
		then
			return 0
		fi;
	done
	return 1
}

if [ ! -d $DOTFILES_DIR ]
then
	echo "Couldn't find a directory at $DOTFILES_DIR. Aborting..."
	exit
fi

cd $DOTFILES_DIR >/dev/null

for path in .*
do
	if inRegexList $path ${excludes[@]}
	then
		echo "    EXCLUDED: $path"
	elif [ ! -h ~/$path ]
	then
		ln -vis $DOTFILES_DIR/$path ~
	else
		echo "  ALREADY EXISTS: $path"
	fi

done

cd - >/dev/null

