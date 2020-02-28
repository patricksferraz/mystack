#!/bin/bash

echo ""
echo -e "${GRE}Installing utils${CLS}"
egrep -q "alias up" $HOME/.zshrc
if [ $? -ne 0 ]
then
    echo "alias up='sudo apt-get update \
        && sudo apt-get upgrade -y \
        && sudo apt-get dist-upgrade -y \
        && sudo apt-get autoremove -y \
        && sudo apt-get autoclean -y'" >> $HOME/.zshrc
fi
echo -e "${GRE}done${CLS}"
