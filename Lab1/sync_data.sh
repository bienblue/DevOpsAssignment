#!/bin/bash

SOURCE_DIR="/home/bngocho/DevOpsAssignment/Lab1/SourceArtifact"
BACKUP_DIR="/home/bngocho/DevOpsAssignment/Lab1"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup and compress the files
tar -czvf "$BACKUP_DIR/$BACKUP_FILE" -C "$SOURCE_DIR" .

# Notify completion
echo "Backup completed: $BACKUP_DIR/$BACKUP_FILE"
