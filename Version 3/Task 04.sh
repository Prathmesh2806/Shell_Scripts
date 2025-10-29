#############################################################################
#     Script Name   :  Task 04.sh                                           #               
#     Version       :  2.0                                                  #                 
#     Date          :  17 Oct 2025                                          #               
#     Credit        :  Team CloudEthix                                      #             
#     Purpose       :  A shell script program file to backup a specified    # 
#                      directory to a remote server using rsync and ssh.    #
#                                                                           #
#############################################################################

#!/bin/bash
LOCAL_DIR=$1
REMOTE_USER=$2
REMOTE_IP=$3
REMOTE_DIR=$4

if [ $# -ne 4 ]; then
    echo "Usage: $0 <local_dir> <remote_user> <remote_ip> <remote_dir>"
    exit 1
 elif [ ! -d "$1" ]; then
    echo "Error: Local directory '$1' does not exist."
    exit 2
 else    
rsync -avz "$LOCAL_DIR" "${REMOTE_USER}@${REMOTE_IP}:${REMOTE_DIR}"

 if [ $? -eq 0 ]; then
    echo "Backup taken successfully"
    
 else
    echo "Error in taking backup"
    exit 3
 fi
fi