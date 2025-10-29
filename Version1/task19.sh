############################################################################
#     Script Name   :  Task 19.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that automates the      #
#                      process of creating a new MySQL database, user, and #
#                      granting privileges.                                # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
read -p "Enter the name of the new database: " DB_NAME
read -p "Enter the new MySQL username: " DB_USER
read -s -p "Enter the password for the new user: " DB_PASS
echo
sudo mysql <<EOF
CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF
if
        [ $? -eq 0 ];then
        echo " database '$DB_NAME' and user '$DB_USER' created successfully."
else
        echo "database not created"
fi