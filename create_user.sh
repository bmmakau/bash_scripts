#! /bin/bash
echo 'Create a new user.'
read -rp 'Enter username: ' username
getent passwd "$username" >> /dev/null #check if user uxists

while [ $? -eq 0 ]; do
   echo 'This username is already taken.'
   read -rp 'Please enter a different username: ' username
   getent passwd "$username" >> /dev/null
done

#add user
useradd -m -g Sales -s /bin/bash "$username"
echo "user $username created successfully, create Password."
passwd "$username"
