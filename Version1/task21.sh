############################################################################
#     Script Name   :  Task 21.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that calculates the     #
#                      total disk space used by a specified user and       #
#                      outputs the result.                                 # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
read -p "Enter the username: " USERNAME
if ! id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' does not exist."
    exit 1
fi
TOTAL_USAGE=$(du -sh /home/$USERNAME 2>/dev/null | awk '{print $1}')
echo "Total disk space used by '$USERNAME': $TOTAL_USAGE"