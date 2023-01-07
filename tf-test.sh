#!/bin/sh
set -e
if [ $# -eq 1 ]; then
    COMMAND=$1
    module_dir=$(find ./modules -type d)
    pwd=$(pwd)
    for dir in $module_dir
    do
        if [ "$dir" != "./modules" ]; then
            if [ "$COMMAND" = "fmt" ]; then
                terraform fmt -check
            elif [ "$COMMAND" = "validate" ]; then
                echo "$dir"
                terraform init
                terraform validate
            fi
            cd "$pwd"
        fi
    done
fi