############################################################################
#     Script Name   :  Task 20.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that retrieves the      #
#                      current weather for a specified location using a    #
#                      weather API.                                        # 
#                                                                          #
#                                                                          #
############################################################################


#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 <location>"
    exit 1
fi

LOCATION="$1"
curl -s "https://wttr.in/${LOCATION}?format=3"
