#! /bin/bash
read -p "Enter a user name: " USER
echo "Archiving user: $USER"

# Lock the account
passwd -l $USER

# Create an archive of the home directory.
if [ ! -d /archives ]
then
	mkdir /archives
	echo creating /archives directory
fi

tar czf /archives/${USER}.tar.gz /home/${USER}

