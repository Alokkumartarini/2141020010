#!/bin/bash

LOG_FILE="/mnt/c/Users/alokt/OneDrive/Desktop/Capstone_5/logs/maintenance_suite.log"
mkdir -p "$(dirname "$LOG_FILE")"

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; CYAN='\033[0;36m'; NC='\033[0m'
log() { echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"; }

while true; do
    echo -e "\n${BLUE}🔧 Welcome to the System Maintenance Suite!${NC}"
    echo "=========================================="
    echo "1. 🗃️ Backup Files"
    echo "2. 📦 System Update and Cleanup"
    echo "3. 🔍 Monitor System Logs"
    echo "4. 🚪 Exit"
    echo "=========================================="
    read -p "📌 Please enter your choice (1-4): " choice

    case $choice in
        1) log "User selected Backup"; bash backup.sh ;;
        2) log "User selected System Update"; bash update_cleanup.sh ;;
        3) log "User selected Log Monitoring"; bash log_monitor.sh ;;
        4) log "User exited the suite"; echo -e "${YELLOW}👋 Goodbye! Stay safe.${NC}"; exit ;;
        *) echo -e "${RED}❌ Invalid option. Please choose 1, 2, 3 or 4.${NC}" ;;
    esac
done
