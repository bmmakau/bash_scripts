#! /bin/bash

#create a new group.
read -rp 'Enter group name: ' group_name
getent group "$group_name" >> /dev/null

#check if groupname exists
while [ $? -eq 0 ]; do
    echo -n "The group name already exists."
    read -rp 'Enter group name: ' group_name
    getent group "$group_name" >> /dev/null
done

#create group
groupadd "$group_name"
if [ $? -eq 0 ]; then
     echo "group $group_name successfully created."

else
   echo 'An error occured.'
   
fi
