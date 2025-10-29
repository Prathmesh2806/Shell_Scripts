############################################################################
#     Script Name   :  Task 07.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that reports usage of   #
#                      cpu,memory and disk utilization.                    #                
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
echo "System Resource Usage Report"
echo  "CPU Usage:"
top -bn1 | grep "Cpu(s)"

echo  "Memory Usage:"
free -h

echo "Disk Usage:"
df -h

echo "Report complete."