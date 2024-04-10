#!/bin/bash
[ -e "$1" ] && echo "$2 $1" | sha256sum -c --status && echo "ok" || echo "invalid"
