############################################################################
#     Script Name   :  Task 10.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file to fetches data from    #
#                      and AWS EC2 API and processes the JSON response to  #
#                      print instance IDs and its public and private IP    #
#                      address.                                            # 
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 <json_file>"
    exit 1
fi

JSON_FILE="$1"
jq -r '.Reservations[].Instances[] | "Instance ID: \(.InstanceId), Private IP: \(.PrivateIpAddress), Public IP: \(.PublicIpAddress)"' "$JSON_FILE"
