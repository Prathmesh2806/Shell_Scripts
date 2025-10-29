############################################################################
#     Script Name   :  Task 01.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that lists all files in #
#                      a specified directory and saves the output to a text#
#                      file.                                               # 
#                                                                          #
#                                                                          #
############################################################################


#!/bin/bash
DIR="$1"
OUTPUT_FILE="${2:-redirected.txt}"  
if [ $# -lt 1 ]; then
    echo "Usage: $0 <directory> [output_file]"
    exit 1

elif [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 2
else
    ls "$DIR" > "$OUTPUT_FILE"
    echo "Successfully listed '$DIR' into '$OUTPUT_FILE'."
fi