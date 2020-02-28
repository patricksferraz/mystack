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
   echo "Usage: `basename $0` [-hv][-i software]"
   echo "Options:"
   echo -e "\ti: software to install"
   echo -e "\th: see this message"
   echo -e "\tv: get software version"
   echo "Softwares:"
   echo -e "\tbasic: only dependencies and oh-my-zsh"
   echo -e "\tconda"
   echo -e "\tdocker"
   echo -e "\tutils"
   echo -e "\tall: install all softwares"
   exit
}

while getopts "hvi:" OPT
do
    case $OPT in
        h) helpMessage ;;
        v)
            echo "`basename $0` version 0.1"
            exit ;;
        i)
            DO_INSTALL=1
            softs+=$OPTARG ;;
        ?) helpMessage ;;
    esac
done
shift $((OPTIND-1))

if [ $DO_INSTALL ]
then
    install/./up.sh
    for soft in ${softs[@]}
    do
        case $soft in
            basic) sh install/softwares/./dependencies.sh ;;
            conda) install/softwares/./miniconda.sh ;;
            docker) install/softwares/./docker.sh ;;
            utils) install/softwares/./utils.sh ;;
            all)
                install/softwares/./dependencies.sh
                install/softwares/./miniconda.sh
                install/softwares/./docker.sh
                install/softwares/./utils.sh ;;
        esac
    done
fi
