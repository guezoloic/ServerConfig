#!/bin/bash

DIR="<Program Directory>" # change to your program's parent dir

AWS="<AWS-server Name>" # change to your AWS server name
BACKUP="$DIR/backup_file.bak"
LOG="/var/log/save-aws.log" 

if [ ! -f "$BACKUP" ]; then
    touch $BACKUP
    echo "Backup error $PATH -/> $AWS : $BACKUP created. Please include only the dirname in this file." >> $LOG
    exit 1
fi

while IFS= read -r PATH || [ -n "$PATH" ]; do
    if [ -d "$PATH" ] || [ -f "$PATH" ]; then
        aws s3 sync "$PATH" "s3://$AWS/$(basename "$PATH")" --delete || {
            echo "Backup error $PATH -/> $AWS : Error while syncing to the AWS server." >> $LOG
            exit 1
        } 
    else 
        echo "Backup error $PATH -/> $AWS : $PATH not found." >> $LOG
        exit 1
    fi
done < "$BACKUP"

echo "Backup succeed: all files synced to -> s3://$AWS" >> $LOG