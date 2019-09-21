#!/bin/bash 
#Michael LaSalvia: DigitalOffensive
#OSCP Backup Script
#edit the file names / locations and place in crontab

bkr=`pgrep rclone`
if [ "$bkr" != "" ]
then
 cp /root/OSCP-NOTES.ctb ~/oscpbk/oscpbk/backup-`date +%F+%H`.ctb
 echo "Backup completed @ `date`" >> /var/log/autobackup.log
else
 nohup rclone mount googledrive: ~/oscpbk/ &  
 echo "rclone note running, starting the process `date`" >> /var/log/autobackup.log
 sleep 10
 cp /root/OSCP-NOTES.ctb ~/oscpbk/oscpbk/backup-`date +%F+%H`.ctb
 echo "Backup completed @ `date`" >> /var/log/autobackup.log
fi 
