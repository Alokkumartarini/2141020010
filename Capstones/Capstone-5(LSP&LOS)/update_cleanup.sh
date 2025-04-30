#!/bin/bash

LOG_DIR="/mnt/c/Users/alokt/OneDrive/Desktop/Capstone_5/logs"
LOG_FILE="$LOG_DIR/update_cleanup.log"
mkdir -p "$LOG_DIR"

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
log() { echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"; }

echo -e "${CYAN}🔄 Starting system update and cleanup...${NC}"
log "System update and cleanup started."

echo -e "${YELLOW}📦 Updating package list and upgrading packages...${NC}"
sudo apt update && sudo apt upgrade -y
log "System update completed."

echo -e "${YELLOW}🧹 Removing unnecessary packages and cleaning up...${NC}"
sudo apt autoremove -y && sudo apt autoclean
log "System cleanup completed."

echo -e "${GREEN}✅ All done! Your system is now updated and clean.${NC}"
echo -e "${CYAN}📋 Log saved at: $LOG_FILE${NC}"
