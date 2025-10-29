############################################################################
#     Script Name   :  Task 08.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file to check whether the    # 
#                      site is up or down.                                 #
#                                                                          #
###########################################################################

#!/bin/bash
read -p "Enter website URL" site
curl "$site" > /dev/null
if [ $? -eq 0 ]; then
    echo "$site is up"
else
    echo "$site is down"
fi