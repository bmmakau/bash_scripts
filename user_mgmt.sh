#! /bin/bash
#create group
echo 'Create a new group.'
read -rp 'Please enter a group name: ' group_name
getent group "$group_name" >> /dev/null

#if the previous command succeeds, then group exists
while [ $? -eq 0 ]; do
   echo -n 'Group name already exists. '
   read -rp 'Please enter another group name: ' group_name
   getent group "$group_name" >> /dev/null
done

#create group
groupadd "$group_name"
echo "group $group_name has been created."

#create user

echo 'Create a user and add them to group.'
read -rp 'Enter username: ' username
getent passwd "$username" >> /dev/null

#check if username is taken
while [ $? -eq 0 ]; do
    echo -n 'Username already taken. '
    read -rp 'Enter a different username: ' username
    getent passwd "$username" >> /dev/null
done

#create user
useradd -m -s /bin/bash -g "$group_name" "$username"
#set password
passwd "$username"

#set ownership
chown "$username":"$group_name" /home/"$username"
#set file permission
chmod 1740 /home/"$username"