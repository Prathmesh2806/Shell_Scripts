############################################################################
#     Script Name   :  Task 14.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that compares two       #
#                      directories and reports any differences in their    #
#                      content.                                            # 
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
DIR1=$1
DIR2=$2
if [[ $# -ne 2 ]]; then
   echo "Error: Two directory paths are required."
   echo "Usage: $0 DIR1 DIR2"
   exit 1

else
   [[ ! -d "$DIR1" ]]; 
   echo "Error: '$DIR1' is not a valid directory."
   exit 1
fi

if [[ ! -d "$DIR2" ]]; then
  echo "Error: '$DIR2' is not a valid directory."
  exit 1
fi
echo "Comparing directories:"
echo "DIR1 = $DIR1"
echo "DIR2 = $DIR2"
echo "Differences between the two directories:"
diff -r "$DIR1" "$DIR2"
exit $?
