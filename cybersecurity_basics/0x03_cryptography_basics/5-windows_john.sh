#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt --format=NT "$1" && john --show "$1" | grep -v '^$' | awk -F: '{print $2}' >> 5-password.txt
