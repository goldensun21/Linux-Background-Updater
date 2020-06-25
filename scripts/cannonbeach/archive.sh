#!/bin/bash
#Cannon Beach Archiver for Linux

#Declare variables
REMOTEUSER=yourUserName
HOSTIP=yourIPaddress

#Create working directories if not already there
mkdir ~/scripts/cannonbeach/photos/dailyarchive
mkdir ~/background/archive/Daily\ Archive/

#Pause
sleep 1

#Remove previous day's archive
rm -r ~/background/archive/Daily\ Archive/
ssh $REMOTEUSER@$HOSTIP rm -r "/path/to/send/to/other/host"

#Recreate working archive directories
mkdir ~/background/archive/Daily\ Archive/

#Move archive to Samba share and scp to mac
mv ~/scripts/cannonbeach/photos/dailyarchive/* ~/background/archive/Daily\ Archive/
sleep 5
rsync -az ~/background/archive/Daily\ Archive $REMOTEUSER@$HOSTIP:"/path/to/send/to/other/host"
