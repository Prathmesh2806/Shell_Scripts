############################################################################
#     Script Name   :  Task 23.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that performs a search  #
#                      and replace operation on multiple files in a        #
#                      directory.                                          # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
read -p "enter the directory path" DIR
read -p "enter the text to search" SEARCH
read -p "enter the replacement text" REPLACE
for FILE in "$DIR"/*; do
    if [[ -f "$FILE" ]]; then
        sed -i "s/${SEARCH}/${REPLACE}/g" "$FILE"
        echo "Updated $FILE"
    fi
done
echo "search and replacement is been done"