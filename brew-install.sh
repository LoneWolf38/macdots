#!/bin/bash

if test ! $(which brew); then
	echo " Installing HomeBrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo >>/root/.bashrc
	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>/root/.bashrc
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	brew update
else
	echo "HomeBrew is already installed"
fi

echo "Installing HomeBrew apps"

brew bundle --install --file=/root/dotfiles/BrewFile
