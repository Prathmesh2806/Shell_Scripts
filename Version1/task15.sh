############################################################################
#     Script Name   :  Task 15.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that finds and lists all#
#                      files in a directory tree that have not been        #
#                      accessed in a specified number of days.             #  
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
read -p "enter the path to check:" DIR
read -p "enter the no of days:" DAYS
find "$DIR" -type f -atime +"$DAYS"