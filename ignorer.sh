#!/bin/bash
touch .gitignore

while [ $# -gt 0 ]; do
    wget --spider -qO- https://raw.githubusercontent.com/Delphboy/gitignore/master/$1.gitignore
    if [ $? -ne 0 ]; then
        echo "Error downloading $1.gitignore"
        echo "Please ensure that the gitignore file exists at https://github.com/github/gitignore"
    else
        echo "$(wget -qO- https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore)" >> .gitignore
    fi
    shift
done
