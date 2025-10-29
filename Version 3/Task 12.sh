############################################################################
#     Script Name   :  Task 12.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that periodically syncs #
#                      a local directory with a remote server using 'rsync'# 
#                      and 'cron'.                                         # 
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
SRC_DIRECTORY=$1
DEST_USERNAME=$2
DEST_IP=$3
DEST_DIR=$4
DEST_PORT=$5
if [[ $# != "5" ]]; then
    echo "Script requires at least 5 ARGS"
    echo "Usage = $0 SRC_DIRECTORY DEST_USERNAME DEST_IP DEST_DIR DEST_PORT"
    exit 1
else
    echo "Checking remote connectivity on IP $DEST_IP on port $DEST_PORT ......"
    sleep 3
    nc -zv $DEST_IP $DEST_PORT >/dev/null 2>&1
    EXT_STA=$?
    if [[ $EXT_STA == "0" ]]; then
        echo "Remote port is open. Now copying data to Destination"
        rsync -avz $SRC_DIRECTORY $DEST_USERNAME@$DEST_IP:$DEST_DIR
        echo "Data copied successfully."
    else
        echo "Port $DEST_PORT on $DEST_IP is not reachable."
        echo "Please check the connectivity."
    fi
fi
read -p "Do you want to schedule this script as a cron job? (y/n): " ADD_CRON

if [[ "$ADD_CRON" == "y"]]; then
    echo "Enter cron schedule expression"
    read CRON_SCHEDULE

    SCRIPT_PATH=$(realpath "$0")
    CRON_JOB="$CRON_SCHEDULE bash $SCRIPT_PATH $SRC_DIRECTORY $DEST_USERNAME $DEST_IP $DEST_DIR $DEST_PORT >> /var/log/sync_with_cron.log 2>&1"

    (crontab -l 2>/dev/null | grep -Fv "$SCRIPT_PATH" ; echo "$CRON_JOB") | crontab -

    echo "Cron job added successfully."
else
    echo "Skipping cron setup."
fi