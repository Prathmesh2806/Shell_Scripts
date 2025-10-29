############################################################################
#     Script Name   :  Task 18.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that monitors a         #
#                      specified file for changes and executes a specific  #
#                      action when the file is modified.                   # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 /path/to/file"
    exit 1
fi

FILE="$1"
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found."
    exit 2
fi

MODTIME=$(stat -c %Y "$FILE")

while true; do
    NEW_MODTIME=$(stat -c %Y "$FILE")
    if [ "$NEW_MODTIME" != "$MODTIME" ]; then
        echo "File changed! at $(date)"
        MODTIME=$NEW_MODTIME
    fi
    sleep 2
done
