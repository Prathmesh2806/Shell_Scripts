############################################################################
#     Script Name   :  Task 20.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that retrieves the      #
#                      current weather for a specified location using a    #
#                      weather API.                                        # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
read -p "enter location name" LOCATION 
curl -s "https://wttr.in/{$LOCATION}?format=3"
