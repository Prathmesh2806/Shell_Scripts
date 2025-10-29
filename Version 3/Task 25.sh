############################################################################
#     Script Name   :  Task 25.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that generates and      #
#                      emails a report of newly created user accounts on a #
#                      Linux system within the last 24 hours.              #      # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
DIR="$1"
DAYS="$2"
if [ $# -lt 2 ]; then
    echo "Usage: $0 <directory> <days>"
    exit 1

elif [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 2
else

USERREPORT=$(find "$DIR" -maxdepth 1 -mindepth 1 -type d -mtime "-$DAYS")

if [ -n "$USERREPORT" ]; then
    echo -e "These are the new users created in the last $DAYS days under '$DIR':\n$USERREPORT"
else
    echo "There are no new users created in the last $DAYS days under '$DIR'."
fi
fi