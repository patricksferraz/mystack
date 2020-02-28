#!/bin/bash

echo ""
echo -e "${GRE}Installing dependencies${CLS}"
apt-get install zsh curl git -y
echo -e "${GRE}done${CLS}"

echo ""
echo -e "${GRE}Installing Oh My Zsh${CLS}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
sed -i 's/auth       required   pam_shells.so/auth       sufficient   pam_shells.so/g' /etc/pam.d/chsh
chsh -s /bin/zsh
sed -i 's/auth       sufficient   pam_shells.so/auth       required   pam_shells.so/g' /etc/pam.d/chsh
echo -e "${GRE}done${CLS}"

echo ""
echo -e "${GRE}Configuring zsh${CLS}"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="cloud"/g' $HOME/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh_reload)/g' $HOME/.zshrc
echo -e "${GRE}done${CLS}"
