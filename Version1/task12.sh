############################################################################
#     Script Name   :  Task 12.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that periodically syncs #
#                      a local directory with a remote server using 'rsync'# 
#                      and 'cron'.                                         # 
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
read -p "Enter the source path of directory" LOCAL_DIR
read -p "Enter the remote user name" REMOTE_USER
read -p "Enter the remote user ip" REMOTE_IP
read -p "Enter the remote directory path" REMOTE_DIR

rsync -avz "$LOCAL_DIR" "$REMOTE_USER@$REMOTE_IP:$REMOTE_DIR"
if
        [ $? = 0 ];then
        echo "backup taken succesfully"
else
        echo "error in taking backup"
fi