############################################################################
#     Script Name   :  Task 22.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that sends a daily      #
#                      summary of system logs via email.                   #
#                                                                          # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
EMAIL="dummyuser@gmail.com"
PURPOSE="daily system log summary - $(date '+%Y-%m-%d')"
tail -n 15 /var/log/messages | mail -s "$PURPOSE" "$EMAIL"
echo "daily system log summary sent to $EMAIL."