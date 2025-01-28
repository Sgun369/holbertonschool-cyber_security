#!/bin/bash
attacker=$(grep -Eo '[0-9]{1,3}(\.[0-9]{1,3}){3}' "$1" | sort | uniq -c | sort -nr | head -n 1); echo "$attacker" | awk '{print "IP:", $2, "Requests:", $1}'
