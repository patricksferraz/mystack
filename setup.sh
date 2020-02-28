#!/bin/bash

export RED="\e[31m"
export GRE="\e[32m"
export CLS="\e[0m"

if [ $UID -ne 0 ]
then
  echo -e "${RED}Please run as root${CLS}"
  exit
fi

helpMessage() {
   echo "Usage: `basename $0` [-hv] <-i>"
   echo "Options:"
   echo -e "\ti: install all stack"
   echo -e "\th: see this message"
   echo -e "\tv: get software version"
   exit
}

while getopts "hvi" OPT
do
    case $OPT in
        h) helpMessage ;;
        v)
            echo "`basename $0` version 0.1"
            exit
            ;;
        i) DO_INSTALL=1 ;;
        ?) helpMessage ;;
    esac
done
# shift $((OPTIND-1))

if [ -z $1 ]
then
    helpMessage
fi

if [ $DO_INSTALL ]
then
    install/./up.sh
    install/softwares/./dependencies.sh
    install/softwares/./miniconda.sh
fi
