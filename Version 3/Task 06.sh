###########################################################################
#     Script Name   :  Task 06.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that compresses and     # 
#                      archives log files older than a certain amount of   #
#                      days.                                               #
###########################################################################

#!/bin/bash
if [ $# -ne 3 ]; then
    echo "Usage: $0 <log_dir> <archive_dir> <days_old>"
    exit 1
else 
    echo "Arguments are not provided"
fi

LOG_DIR=$1
ARCH_DIR=$2 
OLD_DAYS=$3

echo "Archiving log files in $LOG_DIR older than $OLD_DAYS day(s)..."
find "$LOG_DIR" -type f -name "*.txt" -mtime +"$OLD_DAYS" ! -path "$ARCH_DIR/*" -exec gzip {} \;
find "$LOG_DIR" -type f -name "*.txt.gz" -mtime +"$OLD_DAYS" ! -path "$ARCH_DIR/*" -exec mv {} "$ARCH_DIR" \;
echo "Archiving complete. Files moved to: $ARCH_DIR"
