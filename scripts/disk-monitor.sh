#!/bin/bash

source /usr/local/bin/notifications.sh

disk_usage() {
    df -h / | grep / | awk -v max="$1" '{
        usage = $5;
        gsub("%", "", usage);
        if (usage > max) {
            printf "<b>🚨 WARNING:</b>\nDisk usage is at %d%%. which exceed the treshold of %d%%.\n\n", usage, max;
        } 
        printf "<b>💾 Disk Usage Information:</b>\nTotal Size: %s, Used: %s, Available: %s\n\n", $2, $3, $4;
    }'
}

send_notification "$(disk_usage 80)"
