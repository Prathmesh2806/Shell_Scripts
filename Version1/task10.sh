############################################################################
#     Script Name   :  Task 10.sh                                          #               
#     Version       :  1.0                                                 #                 
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
read -p "Enter the JSON file name: " JSON_FILE
jq -r '.Reservations[].Instances[] | "Instance ID: \(.InstanceId), Private IP: \(.PrivateIpAddress), Public IP: \(.PublicIpAddress)"' "$JSON_FILE"