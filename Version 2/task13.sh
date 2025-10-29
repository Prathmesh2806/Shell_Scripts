############################################################################
#     Script Name   :  Task 13.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that automates the      #
#                      process of setting up a new virtual host on a web   #
#                      server.                                             # 
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
read -p "Domain name" DOMAIN
DIR="/var/www/$DOMAIN"
CONF="/etc/httpd/conf.d/$DOMAIN.conf"
mkdir -p "$DIR"
echo "$DOMAIN is live" > "$DIR/index.html"
cat > "$CONF" <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $DIR
</VirtualHost>
EOF
systemctl reload httpd
echo "$DOMAIN virtual host created"