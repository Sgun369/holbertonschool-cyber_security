#!/bin/bash

# check if a user was provided as an argument
if [ -z "$1" ]; then

  echo "Usage: $0 <username>"

  exit 1

fi

ps -U "$1" -o pid,user,%mem,%cpu,vsz,rss | awk '
BEGIN {FS=" "}
{
    if ($5 > 0 && 6 >0) {
        printf "%-5s %-8s %-4s %-4s %-6s %-6s\n", $1, $2, $3, $4, $5, $6
    }
}
'