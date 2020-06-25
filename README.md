# Linux-Background-Updater
 Cannon Beach background updater/archiver for linux/raspberry pi

 Simply place the folders in this repo in the user directory of your pi
 Then, add the items in the crontab.txt to your crontab using $ crontab -e
 Note that you will need to change some ssh variables in the archive.sh to fit your environment
 You will also need to change your file paths for scp and rsync to match the host you want to send to
 Can also set up these folders to be viewed in a samba share
