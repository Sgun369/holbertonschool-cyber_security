#!/bin/bash

LOG_FILE="logs.txt"

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Log file $LOG_FILE does not exist!"
    exit 1
fi
MOST_REQUESTS_IP=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1)

echo "IP address with the most requests: $MOST_REQUESTS_IP"

