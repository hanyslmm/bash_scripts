function backup_file () {
       if [ -f $FILE ]
       then
	       # copy the file to /tmp
	       local BACK="/tmp/$(basename ${FILE}).$(date +%F).$$"
	       echo "Backing up $FILE to ${BACK}"
               cp $FILE $BACK
                
        else    
                # The file does not exist.
                return 1
        fi      
}       

# user input to read file
read -p "enter the file you need to backup: " FILE

backup_file $FILE

# Make a decision based on the exit status.
if [ $? -eq 0 ]
then
        echo "Backup succeeded!"
	echo "check /tmp/$FILE directory"
else
        echo "Backup failed!"
        # Abort the script and return a non-zero exit status.
        exit 1
fi


