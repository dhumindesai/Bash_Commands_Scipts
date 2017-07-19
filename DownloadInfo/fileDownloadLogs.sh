#!/bin/bash


# Download and exract file
echo --------------DOWNLOADING--------------------------------
LINK=https://archive.org/download/stackexchange/unix.stackexchange.com.7z
FILE_DIR=file7z
mkdir $FILE_DIR
BEFORE_TIME=$(date +%s)
wget $LINK
AFTER_TIME=$(date +%s)
TIME_DIFFERENCE=$(echo $AFTER_TIME-$BEFORE_TIME | bc)

#saving archive info to fileInfo.txt
7z l unix.stackexchange.com.7z > fileInfo.txt

echo -----------------EXCTRACTING FILES-------------------------
7z e unix.stackexchange.com.7z -o$FILE_DIR
rm unix.stackexchange.com.7z

#calculating size amd compretion ratio
touch fileInfo.txt
ORIGINALSIZE=$(grep files fileInfo.txt | awk '{print $3 / 1024 / 1024 }')
COMPSIZE=$(grep files fileInfo.txt | awk '{print $4 / 1024 / 1024 }')
COMPRESSIONRATIO=$(echo "scale=2;$ORIGINALSIZE / $COMPSIZE" | bc -l)


echo The Original File Size is $ORIGINALSIZE
echo The Compressed File Size is $COMPSIZE
echo The Compression Ratio is  $COMPRESSIONRATIO
echo -----------------------File Names---------------------------------------------
ls $FILE_DIR
echo -----------------------Line Counts for each files----------------------------
wc -l $FILE_DIR/*
echo -----------------------Download info----------------------------------------
DOWNSPEED_MAN=$(echo "scale=2;$COMPSIZE/$TIME_DIFFERENCE" | bc)
echo duration is $TIME_DIFFERENCE seconds
echo Manual Download speed is $DOWNSPEED_MAN MB/s

get_download_speed()
{
	BEFORE_TIME=$(date +%s)
	wget $LINK

	AFTER_TIME=$(date +%s)
	TIME_DIFFERENCE=$(echo $AFTER_TIME-$BEFORE_TIME | bc)
	DOWNSPEED_MAN=$(echo "scale=4;$COMPSIZE/$TIME_DIFFERENCE/1024/1024" | bc)
	echo time difference is $TIME_DIFFERENCE
	echo Manual Download speed is $DOWNSPEED_MAN MB/s
}

