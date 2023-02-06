#!/bin/sh
set -e
if [ $# -eq 4 ]; then
    BASE_BRANCH=$1
    FEATURE_BRANCH=$2
    MODULE=$3
    COMMAND=$4
    echo "Parameters: BASE_BRANCH=$BASE_BRANCH, FEATURE_BRANCH=$FEATURE_BRANCH, MODULE=$MODULE, COMMAND=$COMMAND"
    if [ -d "${MODULE}" ]; then
        if [ "$BASE_BRANCH" = "dev" ] || [ "$BASE_BRANCH" = "main" ]; then
            cd "${MODULE}" || exit 1
            if [ "$BASE_BRANCH" = "dev" ]; then
                cd dev || { echo "**************** DEV folder does not exist ********************"; exit 1; } 
            elif [ "$BASE_BRANCH" = "main" ]; then
                cd prod || { echo "**************** PROD folder does not exist ********************"; exit 1; }
            fi
            echo "*************** TERRAFORM $COMMAND ********************************"
            echo "******* At branch: $FEATURE_BRANCH *****************************"
            echo "***************************************************************"
            if [ "$COMMAND" = "init" ]; then  
                terraform init -upgrade -input=false
            elif [ "$COMMAND" = "plan" ]; then
                terraform plan -lock=false -input=false
            else 
                terraform "$COMMAND"
            fi
        else
            echo "*************** PR not made to a valid environment ******************"
            exit 1
        fi
    else
        echo "***************************** SKIPPING $COMMAND *******************************"
        echo "Branch '$BASE_BRANCH' does not represent an official environment."
        echo "*******************************************************************************"
        exit 1
    fi

else 
  echo "BASE_BRANCH, FEATURE_BRANCH, COMMAND, and MODULE is required in the same order"
  exit 1
fi