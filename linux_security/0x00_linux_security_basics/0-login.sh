#!/bin/bash
[[ $EUID -ne 0 ]] && last -n 5 | awk '{print $1,$5,$6,$7,$8,$9}'
