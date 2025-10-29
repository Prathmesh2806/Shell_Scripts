############################################################################
#     Script Name   :  Task 01.sh                                          #               
#     Version       :  1.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that lists all files in #
#                      a specified directory and saves the output to a text#
#                      file.                                               # 
#                                                                          #
#                                                                          #
############################################################################


#!/bin/bas
CMND=$(ls >> redirected.txt)
echo "succesfully"