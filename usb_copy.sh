#! /bin/bash

#read path of file to be copied
read -rp 'Enter path to file: ' file_path
#read -rp 'Enter number of copies: ' copies
#copied=0

while [ true ]; do
    # check if disk is mounted
    ls -d /dev/sdc1 >> /dev/null
    if [ $? -eq 0 ]; then
        usb_path=$(findmnt /dev/sdc1 | tail -1 | cut -d '/' -f1-4)
        
        echo 'copying file(s) ...'
        cp "$file_path" "$usb_path"
        if [ $? -eq 0 ]; then
            echo "$(tput setaf 2)Finished copying."
            sleep 10s
        else
            echo "$(tput setaf 1)Could not copy files. Please check your drive"
            sleep 10s
        fi        
    else 
        echo "$(tput setaf 1)Please insert a USB drive"
        sleep 2s
    fi
   
done
