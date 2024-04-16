#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or sudo" 1>&2
    exit 1
fi
last -n 5 | awk '{print $1,$5,$6,$7,$8,$9}'
