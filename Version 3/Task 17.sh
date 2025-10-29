############################################################################
#     Script Name   :  Task 17.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that checks for and     #
#                      reports any failed SSH login attempts on a Linux    #
#                      server.                                             # 
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
function SSH_REPORT_EMAIL() {
    echo -e "Hello All, 
   This is system generated email, do not reply to this email.
   
   We have found failed SSH attempts on $(ifconfig | grep inet | head -n 1 | awk '{print $2}')

   Kindly take necessary action ASAP to avoid future inconvenience.
   
   Server Name : - $(hostname)
   Server IP :- $(ifconfig | grep inet | head -n 1 | awk '{print $2}')
   
   Thank & Regards,
   Team CloudEthix"
}

if [ $# -lt 2 ]; then
    echo "Usage: $0 \"search_pattern\" /path/to/logfile"
    exit 1
fi
pattern="$1"
logfile="$2"

if  [ ! -f "$logfile" ]; then
    echo "Error: File '$logfile' not found."
    exit 2
elif [ ! -r "$logfile" ]; then
     echo "Error: File '$logfile' is not readable. Try running with sudo."
     exit 3
fi

sudo grep "$pattern" "$logfile"
SSH_REPORT_EMAIL
exit $?

