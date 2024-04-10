#!/bin/bash
ps -U "$1" -o pid,user,%mem,%cpu,vsz,rss --no-headers | awk '$5 > 0 && 6 > 0 {print $0}' 