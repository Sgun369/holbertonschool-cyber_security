#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt --format=raw-md5 "$1" && john --show "$1" | grep -v -e '^$' | awk -F: '{print $2}' >> 4-password.txt
