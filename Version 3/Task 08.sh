############################################################################
#     Script Name   :  Task 08.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file to check whether the    # 
#                      site is up or down.                                 #
#                                                                          #
###########################################################################

#!/bin/bash
function SITE_DOWN(){
    echo -e "Hello All, 
   This is system generated email, do not reply to this email.
   
   We have found that the site which you want to access is down. $(ifconfig | grep inet | head -n 1 | awk '{print $2}')

   Kindly check the network connectivity or the server.
   
   Server Name : - $(hostname)
   Server IP :- $(ifconfig | grep inet | head -n 1 | awk '{print $2}')
   
   Thank & Regards,
   Team CloudEthix"
}

if [ -z "$1" ]; then
    echo "Usage: $0 <website URL>"
    exit 1
fi
site="$1"
curl -s "$site" > /dev/null

if [ $? -eq 0 ]; then
    echo "$site is up"
else
    SITE_DOWN

fi
