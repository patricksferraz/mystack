#!/bin/bash

echo ""
echo -e "${GRE}Downloading miniconda${CLS}"
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    --output miniconda.sh
chmod +x miniconda.sh

if [ ! -x miniconda.sh ]
then
    echo -e "${RED}[ERROR] Miniconda download error${CLS}"
    exit
fi
echo -e "${GRE}done${CLS}"

echo ""
echo -e "${GRE}Installing miniconda${CLS}"
./miniconda.sh -u -b -p /opt/miniconda && chown $USER:$USER /opt/miniconda
rm -rf miniconda.sh
eval "$(/opt/miniconda/bin/conda shell.zsh hook)" && conda init zsh
echo "auto_activate_base: false" > $HOME/.condarc
echo -e "${GRE}done${CLS}"

echo ""
echo -e "${GRE}Installing completion${CLS}"
if [ ! -e $HOME/.zshrc ]
then
    echo "${RED}[ERROR] $HOME/.zshrc file does not exist${CLS}"
    exit
fi

git clone https://github.com/esc/conda-zsh-completion \
    ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
sed -i 's/plugins=(git zsh_reload)/plugins=(git zsh_reload conda-zsh-completion)/g' \
    $HOME/.zshrc

if [ ! $(egrep "autoload -U compinit && compinit" $HOME/.zshrc) ]
then
    echo "autoload -U compinit && compinit" >> $HOME/.zshrc
fi
echo -e "${GRE}done${CLS}"
