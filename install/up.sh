#!/bin/bash

echo ""
echo -e "${GRE}Update & Upgrade${CLS}"
apt-get update && apt-get upgrade -y
echo -e "${GRE}done${CLS}"
