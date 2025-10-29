############################################################################
#     Script Name   :  Task 16.sh                                          #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file that automatically      #
#                      organizes files in a directory based on their file  #
#                      types (e.g., images, documents, audio files).       #               
#                                                                          #
#                                                                          #
############################################################################

#!/bin/bash
DIR=$1
if [[ -z "$DIR" ]]; then
    echo "Error: Directory path not provided."
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

if [[ ! -d "$DIR" ]]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
fi

cd "$DIR" || exit 1
for file in *; do
    [[ -f "$file" ]] || continue  
    ext="${file##*.}"       
    ext="${ext,,}"

    case "$ext" in
        jpg|jpeg|png|gif) folder="Images" ;;
        pdf|doc|txt|ppt)  folder="Documents" ;;
        mp3)              folder="Audio" ;;
        mp4|mkv|mov)      folder="Videos" ;;
        zip|tar|gz)       folder="Archives" ;;
        *)                folder="Others" ;;
    esac
    mkdir -p "$folder"
    mv "$file" "$folder/"
done
echo "Files organized in '$DIR'"
