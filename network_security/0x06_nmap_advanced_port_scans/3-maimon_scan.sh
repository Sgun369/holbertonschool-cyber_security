#!/bin/bash
sudo nmap -sA -p http,https,ftp,telnet -v --reason $1
