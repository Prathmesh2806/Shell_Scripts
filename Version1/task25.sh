############################################################################
#     Script Name   :  Task 25.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that generates and      #
#                      emails a report of newly created user accounts on a #
#                      Linux system within the last 24 hours.              #      # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
USERREPORT=$(find /home -maxdepth 1 -mindepth 1 -type d -mtime -1)
if [ -n "$USERREPORT" ]; then
    echo -e "These are the new users created in the last 24 hours:\n$USERREPORT"
else
    echo "There are no new users created in the last 24 hours."
fi