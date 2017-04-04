#!/bin/bash
echo "Please enter your sudo password"
sudo echo "Thanks."

dist=$(lsb_release -i)
deb_package=false
rpm_package=false
RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

# Get user info 
read -p "Enter email: " my_email  
read -p "Enter name: " my_username

function install_vim {
    if [ "$deb_package" = true ]; then
	    sudo apt-get install aptitude 	
	    sudo aptitude install vim, curl, git
    elif [ "$rpm_package" = true]; then
        sudo dnf -y update
        sudo dnf install curl, git, vim-enhanced 
    fi
	# Install pathogen
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    # Install vim and configure
	cp vimrc ~/ && cd ~/ && mv vimrc .vimrc
    cd .vim && mkdir _swap
    # Install vim-airline
    cd bundle/ && git clone https://github.com/bling/vim-airline
}

function generate_ssh {
    ssh-keygen -t rsa -b 4096 -C ${my_email}
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    git config --global user.name ${my_username}
    git config --global user.email ${my_email}
}

function install_zsh {
    if [ $deb_package = true ]; then
        sudo aptitude install zsh
    elif [ $rpm_package = true ]; then
        sudo dnf install zsh
    fi
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    # Install zsh highlighting 
    cd ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    # Install zsh auto suggestions
    git clone git://github.com/zsh-users/zsh-autosuggestions 
    # Add options in plugins 
    sed -i.bak "s/^plugins=(\(.*\)/plugins=(zsh-autosuggestions zsh-syntax-highlighting pip python \1/" ~/.zshrc
    chsh -s $(which zsh)
}

if [[ $dist == *"Ubuntu"* ]]; then
	echo -e "${YELLOW}[INFO]Unfortunately, it's Ubuntu :-( Ok, I will execute this script for you....${NC}"
	deb_package=true
elif [[ $dist == *"Fedora"* ]]; then
	echo -e "${GREEN}[DEBUG]Cool :-) It's a Fedora${NC}"
	rpm_package=true
else
    echo -e "${RED}[ERROR]I'm sorry Dave, I'm afraid I can't do that${NC}"
    exit 1
fi

# install_vim
# generate_ssh
install_zsh
echo -e "${GREEN}[DONE]Thats all folks.${NC}"
