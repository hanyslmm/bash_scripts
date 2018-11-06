#! /bin/bash

DATE=$(date +%F)

read -p "enter files extension: " EXT
read -p "enter prefered prefix: (Press ENTER for ${DATE}) " PREF
read -p "enter full path: (Press ENTER for curren working directory) " PATH
P=$(pwd)
echo $P
#echo *$EXT
PICS=*$EXT
echo $PICS

# check on extention

if [ -z $EXT ]
then
	echo "failed plz re-run with correct extension value"
	exit 1
fi

# check on prefix

if [ -z $PREF ]
then
	echo "set PREF value to ${DATE}"
	PREF=${DATE}
fi

# check on path

if [ -z $PATH ]
then
	echo "set PATH to current working directory"
	PATH=$(pwd)
fi



COUNTER=0
cd $PATH
for PIC in $PICS
do
	COUNTER=$[$COUNTER +1]
	echo $COUNTER
	echo "Renaming ${PIC} to ${PREF}-${COUNTER}.${EXT}"

	/bin/mv ${PATH}/${PIC} ${PATH}/${PREF}-${COUNTER}.${EXT}
done


