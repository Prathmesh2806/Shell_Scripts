############################################################################
#     Script Name   :  Task 17.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that checks for and     #
#                      reports any failed SSH login attempts on a Linux    #
#                      server.                                             # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
sudo grep "Failed password" /var/log/secure