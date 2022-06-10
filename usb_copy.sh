#! /bin/bash

#read path of file to be copied
read -rp 'Enter path to file: ' file_path
#read -rp 'Enter number of copies: ' copies
#copied=0

while [ true ]; do
    # check if disk is mounted
    ls -d /dev/sdc1 >> /dev/null
    if [ $? -eq 0 ]; then
        usb_path=$(findmnt /dev/sdc1 | tail -1 | cut -d ' ' -f1)
        
        echo 'copying file(s) ...'
        cp "$file_path" "$usb_path"
        if [ $? -eq 0 ]; then
           spd-say 'Finished copying, insert usb'
          echo 'Finished copying.'
          sleep 10s
        else
           echo 'Could not copy files. Please check your drive'
           spd-say 'Error occured.'
           sleep 10s
        fi        
    else 
        echo 'Please insert a USB drive'
        spd-say 'Insert USB.'
        sleep 2s
    fi
   
done
