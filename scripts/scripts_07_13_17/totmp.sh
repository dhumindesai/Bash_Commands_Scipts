#! /bin/bash


if [ -z $* ]
then
	echo Give files to copy:
	read FILENAMES

else
	FILENAMES="$@"
fi

for f in $FILENAMES
do
	cp $f ~
done
