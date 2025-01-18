#!/bin/bash
sudo nmap -sA -p http,https,ftp,ssh,telnet -v --reason $1
