############################################################################
#     Script Name   :  Task 22.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that sends a daily      #
#                      summary of system logs via email.                   #
#                                                                          # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
function SUMMARY_LOG_EMAIL() {
    echo -e "Hello All, 
   This is system generated email, do not reply to this email.
   
   A daily summary of system logs via email is been sent to $(ifconfig | grep inet | head -n 1 | awk '{print $2}')
   
   Server Name : - $(hostname)
   Server IP :- $(ifconfig | grep inet | head -n 1 | awk '{print $2}')
   
   Thank & Regards,
   Team CloudEthix"
}

if [ $# -lt 2 ]; then
    echo "Usage: $0 <email> <purpose>"
    exit 1
fi

EMAIL="$1"
PURPOSE="$2"

SUBJECT="$PURPOSE - $(date '+%Y-%m-%d')"

tail -n 15 /var/log/messages | mail -s "$SUBJECT" "$EMAIL"

if [ $? -eq 0 ]; then
    echo "Log summary sent to $EMAIL with subject: '$SUBJECT'."
    SUMMARY_LOG_EMAIL
else
    echo "Failed to send log summary to $EMAIL."
    exit 2
fi
