#!/bin/bash

dist=$(lsb_release -i)
deb_package=false
rpm_package=false

function install_vim {

}

function install_zsh {

}

function generate_ssh {

}
 
if [[ $dist == *"Ubuntu"* ]]; then
	echo "Unfortunately, it's Ubuntu"
	deb_package=true
elif [[ $dist == *"Fedora"* ]]; then
	echo "Cool :-) It's a Fedora"
	rpm_package=true
else
	echo "I'm sorry Dave, I'm afraid I can't do that"
fi

if [ "$deb_package" = true ]; then 
	install_vim
	instal_zsh
	generate_ssh	
	echo "It's a .deb"
fi 
