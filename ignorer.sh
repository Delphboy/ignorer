#!/bin/bash
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
touch .gitignore

while [ $# -gt 0 ]; do
    wget --spider -qO- https://raw.githubusercontent.com/Delphboy/gitignore/master/$1.gitignore
    if [ $? -ne 0 ]; then
        echo -e "${red}$1.gitignore \t FAIL Ensure that the gitignore file exists at https://github.com/github/gitignore${reset}"
    else
        echo -e "${green}$1.gitignore${reset} \t has been added to ${PWD}.gitignore"
        echo "$(wget -qO- https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore)" >> .gitignore
    fi
    shift
done
