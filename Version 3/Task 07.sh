############################################################################
#     Script Name   :  Task 07.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that reports usage of   #
#                      cpu,memory and disk utilization.                    #                
#                                                                          #
#                                                                          #
###########################################################################

#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: $0 [cpu] [memory] [disk]"
    echo "Example: $0 cpu memory disk"
    exit 1
fi

echo "System Resource Usage Report"

for arg in "$@"; do
    case "$arg" in
        cpu)
            echo -e "\nCPU Usage:"
            top -bn1 | grep "Cpu(s)"
            ;;
        memory)
            echo -e "\nMemory Usage:"
            free -h
            ;;
        disk)
            echo -e "\nDisk Usage:"
            df -h
            ;;
        *)
            echo -e "\nInvalid argument: $arg"
            echo "Valid options: cpu, memory, disk"
            ;;
    esac
done

echo -e "\nReport complete."
