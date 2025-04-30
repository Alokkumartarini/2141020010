#!/bin/bash

# Set paths
SOURCE_DIR="/mnt/c/Users/alokt/OneDrive/Documents"
DEST_DIR="/mnt/c/Users/alokt/OneDrive/backup"
LOG_DIR="/mnt/c/Users/alokt/OneDrive/Desktop/Capstone_5/logs"
LOG_FILE="$LOG_DIR/backup.log"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Create directories if they don't exist
mkdir -p "$SOURCE_DIR" "$DEST_DIR" "$LOG_DIR"

# Logger function
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Starting message
echo -e "${CYAN}🔄 Starting backup process...${NC}"
log "Backup process started."

# Create timestamped backup file
BACKUP_FILE="$DEST_DIR/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Perform backup
echo -e "${YELLOW}📁 Backing up your Documents folder...${NC}"
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Check result
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Backup completed successfully!${NC}"
    echo -e "${CYAN}🗃️  Backup saved at: $BACKUP_FILE${NC}"
    log "Backup successful: $BACKUP_FILE"
else
    echo -e "${RED}❌ Backup failed! Please check for errors above.${NC}"
    log "Backup failed."
fi

echo -e "${CYAN}📋 Log file saved at: $LOG_FILE${NC}"
