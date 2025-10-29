############################################################################
#     Script Name   :  Task 05.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file to check for software   # 
#                      updates and install them automatically              #
#                                                                          #
###########################################################################

#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <auto_update: yes|no>"
    exit 1
fi

AUTO_UPDATE=$1

sudo yum check-update > /dev/null
exit_status=$?

if [ $exit_status -eq 100 ]; then
    echo "updates are available."

    if [ "$AUTO_UPDATE" == "yes" ]; then
        echo "auto update is enabled. Starting the update process..."
        sudo yum update -y
        echo "The updates have been installed."
    else
        echo "auto update is disabled. Skipping update."
    fi

elif [ $exit_status -eq 0 ]; then
    echo "There are no updates to be done."

else
    echo "yum check-update returned an unexpected status: $exit_status"
fi
