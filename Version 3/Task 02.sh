############################################################################
#     Script Name   :  TASK 02.sh                                          
#     Version       :  2.0                                                                  
#     Date          :  17 Oct 2025                                                        
#     Credit        :  Team CloudEthix                                                  
#     Purpose       :  A shell script program file to check the disk usage when   
#                      exceeds a specific threshold limit.                   
###########################################################################


#!/bin/bash
function DISK_USAGE_LIMIT() {
    echo -e "Hello All, 
   This is system generated email, do not reply to this email.
   
   We have found that disk usage exceeds a specific threshold limit $(ifconfig | grep inet | head -n 1 | awk '{print $2}')

   Kindly take necessary action ASAP to avoid future inconvenience.
   
   Server Name : - $(hostname)
   Server IP :- $(ifconfig | grep inet | head -n 1 | awk '{print $2}')
   
   Thank & Regards,
   Team CloudEthix"
}
if [ $# -ne 2 ]; then
    echo "Usage: $0 <mount_point> <threshold_percent>"
    exit 1
fi
MOUNT_POINT=$1
THRESHOLD=$2
disk_usage=$(df -h "$MOUNT_POINT" | awk 'NR==2 {print $5}' | cut -d'%' -f1)
if [ "$disk_usage" -gt "$THRESHOLD" ]; 
then
    echo "Disk utilization on $MOUNT_POINT exceeds limit: ${disk_usage}% > ${THRESHOLD}%"
    DISK_USAGE_LIMIT
else
    echo "Disk utilization on $MOUNT_POINT is normal: ${disk_usage}% <= ${THRESHOLD}%"
fi
