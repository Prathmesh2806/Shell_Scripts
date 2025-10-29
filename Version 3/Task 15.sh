############################################################################
#     Script Name   :  Task 15.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that finds and lists all#
#                      files in a directory tree that have not been        #
#                      accessed in a specified number of days.             #  
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
DIR=$1
DAYS=$2
if [[ $# -ne 2 ]]; then
   echo "Error: Atleast two arguments required."
   echo "Usage: $0 DIRECTORY DAYS"
   exit 1
else
   [[ ! -d "$DIR" ]]; 
   echo "Error: '$DIR' is not a valid directory."
   exit 1
fi

if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
  echo "Error: '$DAYS' is not a valid number."
  exit 1
fi
echo "Searching for files in '$DIR' not accessed in the last $DAYS days..."
find "$DIR" -type f -atime +"$DAYS"
