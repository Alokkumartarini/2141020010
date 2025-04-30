#!/bin/bash

LOG_FILE="/var/log/dpkg.log"
ALERT_LOG="/mnt/c/Users/alokt/OneDrive/Desktop/Capstone_5/logs/log_monitor.log"
mkdir -p "$(dirname "$ALERT_LOG")"

KEYWORDS=("error" "fail" "critical")
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
log() { echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$ALERT_LOG"; }

> /tmp/log_alerts.txt

echo -e "${CYAN}🔍 Scanning system logs for issues...${NC}"
log "Log scan started."

for keyword in "${KEYWORDS[@]}"; do
    grep -i "$keyword" "$LOG_FILE" >> /tmp/log_alerts.txt
done

if [[ -s /tmp/log_alerts.txt ]]; then
    echo -e "${RED}🚨 Critical issues found in system logs!${NC}"
    log "Critical issues found:"
    cat /tmp/log_alerts.txt | tee -a "$ALERT_LOG"
else
    echo -e "${GREEN}✅ No critical issues found in the logs.${NC}"
    log "No critical issues found."
fi

echo -e "${CYAN}📋 Scan log saved at: $ALERT_LOG${NC}"
