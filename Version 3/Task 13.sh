############################################################################
#     Script Name   :  Task 13.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that automates the      #
#                      process of setting up a new virtual host on a web   #
#                      server.                                             # 
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
DOMAIN=$1

if [[ -z "$DOMAIN" ]]; then
    echo "Error: Domain name not provided."
    echo "Usage: $0 DOMAIN_NAME"
    exit 1
fi

DIR="/var/www/$DOMAIN"
CONF="/etc/httpd/conf.d/$DOMAIN.conf"

mkdir -p "$DIR"
echo "$DOMAIN is live" > "$DIR/index.html"
cat > "$CONF" <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $DIR
    <Directory $DIR>
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog /var/log/httpd/${DOMAIN}_error.log
    CustomLog /var/log/httpd/${DOMAIN}_access.log combined
</VirtualHost>
EOF
systemctl reload httpd
echo "Virtual host for $DOMAIN created successfully."
echo "DocumentRoot: $DIR"
echo "Config file:  $CONF"
