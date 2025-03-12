#!/usr/bin/env bash
#if [[ !(-e /home/matt/.config/home-manager/home.nix)]]; then
#	mkdir /home/matt/.config/home-manager
#	cp -r ./home-manager/* /home/matt/.config/home-manager
#	home-manager switch
#fi
# cp -r /home/matt/.config/home-manager/* ./home-manager/
#sudo cp /home/matt/.config/home-manager/home.nix /etc/nixos/home.nix
cp -r /etc/nixos/* .
sudo nixos-rebuild switch
git add *
git commit -m "updated my stuff"
git push




#!/usr/bin/env bash
#AUTHOR: zenex458
#URL:https://github.com/zenex458/dots/blob/main/.config/nixos/hosts/eukaryotic/home/scripts/updnix

##set -e
##echo "Updating nix"
##updnix=$(sudo nixos-rebuild switch --flake ~/Dev/dots/.config/Nixos/#eukaryotic)
########################################################################
## This script is designed so you can run it in any directory so change#
## the the directory after pushd and the updnix variable################
########################################################################
##if [ -n "$updnix" ]; then
##	pushd "$HOME/dots/.config/Nixos" || exit
##	git add .
##	if [ "$EDITOR" = "nvim" ]; then
##		git diff -U0 '*.nix'
##	fi
##  else
##      echo "updnix variable not set"
##	git commit
##	git push -u origin main
##fi
##
##echo "All done!"
##popd
