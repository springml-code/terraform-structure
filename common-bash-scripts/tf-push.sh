#!/bin/sh
set -e
if [ $# -eq 3 ]; then
    BRANCH_NAME=$1
    MODULE=$2
    COMMAND=$3
    echo "Parameters: BRANCH_NAME=$BRANCH_NAME, MODULE=$MODULE, COMMAND=$COMMAND"
    if [ -d "${MODULE}" ]; then
        if [ "$BRANCH_NAME" = "dev" ] || [ "$BRANCH_NAME" = "main" ]; then
            cd "${MODULE}" || exit 1
            if [ "$BRANCH_NAME" = "dev" ]; then
                cd dev || { echo "**************** DEV folder does not exist ********************"; exit 1; } 
            elif [ "$BRANCH_NAME" = "main" ]; then
                cd prod || { echo "**************** PROD folder does not exist ********************"; exit 1; }
            fi
            echo "*************** TERRAFORM $COMMAND ********************************"
            echo "******* At branch: $BRANCH_NAME *****************************"
            echo "***************************************************************"
            if [ "$COMMAND" = "init" ]; then  
                terraform init -upgrade -input=false
            elif [ "$COMMAND" = "fmt" ]; then
                terraform fmt
            elif [ "$COMMAND" = "validate" ]; then
                terraform validate
            elif [ "$COMMAND" = "plan" ]; then
                terraform plan -lock=false -input=false
            elif [ "$COMMAND" = "apply" ]; then
                terraform apply -input=false -auto-approve
            else 
                echo "COMMAND - $COMMAND does not exist"
                exit 1
            fi
        else
            echo "*************** PR not made to a valid environment ******************"
            exit 1
        fi
        else
            echo "***************************** SKIPPING $COMMAND *******************************"
            echo "Branch '$BRANCH_NAME' does not represent an official environment."
            echo "*******************************************************************************"
            exit 1
        fi
else 
  echo "BRANCH_NAME, COMMAND, and MODULE is required in the same order"
  exit 1
fi