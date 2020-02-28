#!/bin/bash

echo ""
echo -e "${GRE}Installing docker${CLS}"
apt-get install docker docker.io -y
groupadd docker
usermod -aG docker $USER
systemctl start docker
systemctl enable docker
echo -e "${GRE}done${CLS}"
