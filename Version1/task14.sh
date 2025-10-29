############################################################################
#     Script Name   :  Task 14.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that compares two       #
#                      directories and reports any differences in their    #
#                      content.                                            # 
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
read -p "Enter path for first directory: " DIR1
read -p "Enter path for second directory: " DIR2

if [[ ! -d "$DIR1" ]]; then
  echo "error '$DIR1' is not a valid directory."
fi

if [[ ! -d "$DIR2" ]]; then
  echo "error '$DIR2' is not a valid directory."
fi

echo "comparing directories '$DIR1' and '$DIR2'"
echo "the difference in both directories is "
diff -r "$DIR1" "$DIR2"