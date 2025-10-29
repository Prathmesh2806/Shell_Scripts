############################################################################
#     Script Name   :  Task 21.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that calculates the     #
#                      total disk space used by a specified user and       #
#                      outputs the result.                                 # 
#                                                                          #
#                                                                          #
############################################################################


#!/bin/bash
USERNAME="$1"
if [ $# -lt 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
elif ! id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' does not exist."
    exit 2
else
TOTAL_USAGE=$(du -sh "/home/$USERNAME" 2>/dev/null | awk '{print $1}')

if [ -z "$TOTAL_USAGE" ]; then
    echo "Could not calculate the disk usage for user '$USERNAME'."
    exit 3
else
    echo "Total disk space used by '$USERNAME': $TOTAL_USAGE"
fi
fi