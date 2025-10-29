############################################################################
#     Script Name   :  Task 18.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that monitors a         #
#                      specified file for changes and executes a specific  #
#                      action when the file is modified.                   # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
read -p "enter the path of the file" FILE
MODTIME=$(stat -c %Y "$FILE")

while true;
do
  NEW_MODTIME=$(stat -c %Y "$FILE")
  if [ "$NEW_MODTIME" != "$MODTIME" ]; then
          echo "File changed! at $(date)"
    MODTIME=$NEW_MODTIME
  fi
  sleep 2
done