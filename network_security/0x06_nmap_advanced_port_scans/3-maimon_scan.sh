#!/bin/bash
sudo nmap -sA -p http,https,ftp,ssh,telnet -vv --reason $1
