#!/bin/bash
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
touch .gitignore

if [ $1 = "--list" ]; then
    content=$(wget https://github.com/github/gitignore -q -O -) 
    #formated=$(echo $content) | grep -E "html"
    echo "These are the gitignore files currently available:"
    echo $content | grep -Eo ">[A-Za-z]+\.gitignore<" | sed 's/^.\(.*\).$/\1/'
elif [ $1 = "--help" ]; then
	echo "Usage: $ ignorer <ignorer file name> [<ignorer file name>]"
	echo "$ ignorer --list will show all the gitignore files currently on GitHub's gitignore master branch"
else
    while [ $# -gt 0 ]; do
        wget --spider -qO- https://raw.githubusercontent.com/Delphboy/gitignore/master/$1.gitignore
        if [ $? -ne 0 ]; then
            echo -e "${red}$1.gitignore \t FAIL Ensure that the gitignore file exists at https://github.com/github/gitignore or run ignorer --help ${reset}"
        else
            echo -e "${green}$1.gitignore${reset} \t has been added to ${PWD}.gitignore"
            echo "$(wget -qO- https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore)" >> .gitignore
        fi
        shift
    done
fi
