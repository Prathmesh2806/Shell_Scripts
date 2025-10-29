############################################################################
#     Script Name   :  Task 09.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that scans a            #
#                      directory for files matching a certain pattern and  #
#                      deletes them.                                       #
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
read -p "Enter the directory path" dir
read -p "Enter file pattern to delete" pattern
rm -f "$dir"/$pattern
echo "Files deleted matching the '$pattern' in '$dir'"