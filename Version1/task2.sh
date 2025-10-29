############################################################################
#     Script Name   :  TASK 02.sh                                          
#     Version       :  1.0                                                                  
#     Date          :  17 Oct 2025                                                        
#     Credit        :  Team CloudEthix                                                  
#     Purpose       :  A shell script program file to check the disk usage when   
#                      exceeds a specific threshold limit.                   
###########################################################################


#!/bin/bash
disk_usage=$(df -h / | awk 'NR==2 {print $5}'| cut -d'%' -f1)
threshold=30
if
        [ "$disk_usage" > "$threshold" ];then
        echo "disk utilization exceededs limit"

else
        echo "disk utilization is normal"
fi 