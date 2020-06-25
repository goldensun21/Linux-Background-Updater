#!/bin/bash

#Set IP address of host we're sending images to
HOSTIP=yourIPaddress
REMOTEUSER=yourUserName

#Create working directories if not already there
mkdir ~/scripts/cannonbeach/photos
mkdir ~/scripts/cannonbeach/photos/dailyarchive

#Pause
sleep 1

#Remove old current photo
rm ~/background/current/cannon_beach*
ssh $REMOTEUSER@$HOSTIP "rm /Users/isaac/Pictures/Desktop\\ Photos/cannon_beach_*"

#Navigate to working download directory
cd ~/scripts/cannonbeach/photos/

#Download current image of Cannon Beach
wget http://wwc.instacam.com/instacamimg/CNHNB/CNHNB_l.jpg

#Pause
sleep 2

#Copy for transfer to other computer and rename for archive
cp CNHNB_l.jpg ~/scripts/cannonbeach/photos/dailyarchive/cannon_beach_$(date +%m-%d-%Y_%H-%M).jpg
mv CNHNB_l.jpg ~/background/current/cannon_beach_$(date +%m-%d-%Y_%H-%M).jpg

#Send to remote host
rsync -az ~/background/current/cannon_beach_* $REMOTEUSER@$HOSTIP:"/Users/isaac/Pictures/Desktop\\ Photos/"
