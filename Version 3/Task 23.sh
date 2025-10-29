############################################################################
#     Script Name   :  Task 23.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that performs a search  #
#                      and replace operation on multiple files in a        #
#                      directory.                                          # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
if [ $# -lt 3 ]; then
    echo "Usage: $0 <directory_path> <search_text> <replacement_text>"
    exit 1
fi

DIR="$1"
SEARCH="$2"
REPLACE="$3"

if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 2
fi

for FILE in "$DIR"/*; do
    if [[ -f "$FILE" ]]; then
        sed -i "s/${SEARCH}/${REPLACE}/g" "$FILE"
        echo "Updated $FILE"
    fi
done

echo "Search and replacement completed successfully."
