############################################################################
#     Script Name   :  Task 19.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that automates the      #
#                      process of creating a new MySQL database, user, and #
#                      granting privileges.                                # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
if [ $# -lt 3 ]; then
    echo "Usage: $0 <DB_NAME> <DB_USER> <DB_PASS>"
    exit 1
fi

DB_NAME="$1"
DB_USER="$2"
DB_PASS="$3"

sudo mysql <<EOF
CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

if [ $? -eq 0 ]; then
    echo "Database '$DB_NAME' and user '$DB_USER' created successfully."
else
    echo "Error: Failed to create database or user."
    exit 2
fi
