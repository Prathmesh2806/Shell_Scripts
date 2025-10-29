###########################################################################
#     Script Name   :  Task 06.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that compresses and     # 
#                      archives log files older than a certain amount of   #
#                      days.                                               #
###########################################################################

#!/bin/bash
LOG_DIR=/home/prathmesh/msg
ARCH_DIR=/home/prathmesh/arch_dir
OLD_DAYS=1
echo "archiving log files in $LOG_DIR older than $OLD_DAYS"
find "$LOG_DIR" -type f -name "*.txt" -mtime +$OLD_DAYS ! -path "$ARCH_DIR/*" -exec gzip {} \;
find "$LOG_DIR" -type f -name "*.txt.gz" -mtime +$OLD_DAYS ! -path "$ARCH_DIR/*" -exec mv {} "$ARCH_DIR" \;
echo "archiving complete. files moved to: $ARCH_DIR"