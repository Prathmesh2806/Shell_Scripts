############################################################################
#     Script Name   :  Task 03.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file to check wether a       # 
#                      service is running or not and if its not running    #
#                      then to start the service.                          #
###########################################################################

#!/bin/bash
service_name=$1
status=$(systemctl is-active "$service_name")
if [ $# -ne 1 ]; then
    echo "Usage: $0 <service_name>"
    exit 1

elif [ "$status" == "active" ]; then
    echo "$service_name is running"
else
    echo "$service_name is not running"
    echo "Restarting $service_name..."

    if systemctl restart "$service_name"; then
        echo "$service_name restarted successfully"
    else
        echo "$service_name failed to restart"
    fi
fi
