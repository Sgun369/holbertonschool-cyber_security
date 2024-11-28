#!/bin/bash
nslookup -type=A $1 | grep -m1 'Address:' | awk '{print $2}'
