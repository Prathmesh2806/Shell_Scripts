############################################################################
#     Script Name   :  Task 05.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file to check for software   # 
#                      updates and install them automatically              #
#                                                                          #
###########################################################################

#!/bin/bash
sudo yum check-update > /dev/null
exit_status=$?
if
        [ $exit_status -eq 100 ];
then
        echo "updates are available.starting the update process"

elif
        [ $exit_status -eq 0 ];
then
        echo "there are no updates to be done"
if
        [ $exit_status -eq 100 ];
then
        echo "update is been started"
        sudo yum update -y
        echo "the updates are been done"
fi
fi