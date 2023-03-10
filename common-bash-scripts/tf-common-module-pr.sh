#!/bin/sh
set -e
if [ $# -eq 1 ]; then
    COMMAND=$1
    module_dir=$(find ./modules -type d)
    for dir in $module_dir
    do
        cd "$dir"
        if [ "$COMMAND" = "fmt" ]; then
            for file in $(terraform fmt)
            do 
                if [ "${#file}" -gt 0 ]; then 
                    echo "******* Please format your tf files under $dir directory ********"
                    exit 1
                else
                    echo "Formatted Successfully"
                fi
            done
        elif [ "$COMMAND" = "validate" ]; then
            echo "$dir"
            terraform init
            terraform validate
        fi
        cd /workspace
    done
fi
