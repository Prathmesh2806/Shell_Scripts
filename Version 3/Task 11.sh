############################################################################
#     Script Name   :  Task 11.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that adds new users to  #
#                     the system based on a list of names in a CSV file.   # 
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
CSV_FILE="$1"
DEFAULT_PASSWORD="pass123"
if [ $# -lt 1 ]; then
    echo "Usage: $0 <csv_file>"
    exit 1
else
    [ ! -f "$CSV_FILE" ]; 
    echo "CSV file '$CSV_FILE' not found!"
    exit 2
fi

while read username; do
    [ -z "$username" ] && continue

    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
    else
        useradd "$username"
        echo "$username:$DEFAULT_PASSWORD" | chpasswd
        echo "User created: $username"
    fi
done < "$CSV_FILE"
