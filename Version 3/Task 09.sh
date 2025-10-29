############################################################################
#     Script Name   :  Task 09.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that scans a            #
#                      directory for files matching a certain pattern and  #
#                      deletes them.                                       #
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
dir="$1"
pattern="$2"

if [ $# -lt 2 ]; then
    echo "Usage: $0 <directory_path> <file_pattern>"
    exit 1
else
    rm -f "$dir"/$pattern
    echo "Files deleted matching the pattern '$pattern' in directory '$dir'"
fi