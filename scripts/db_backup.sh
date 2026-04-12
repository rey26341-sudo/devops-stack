#!/bin/bash
DATE=$(date +%F)
mysqldump -u root -p password db_name > backup_$DATE.sql

echo "Backup completed: backup_$DATE.sql"

