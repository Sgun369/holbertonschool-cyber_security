#!/bin/bash
[[ $EUID -ne 0 ]] && { echo "This sript must be run as root or sudo" 1>&2; exit 1; }
last -n 5 | awk '{print $1,$5,$6,$7,$8,$9}'
