#!/bin/bash
[ "$EUID" -ne 0 ] && echo "Run as root." && exit 1; [ -z "$1" ] && echo "Usage: $0 <subnetwork>" && exit 1; nmap -sn -PR "$1"
