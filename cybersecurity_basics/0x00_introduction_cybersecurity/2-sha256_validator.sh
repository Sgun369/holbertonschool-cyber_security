#!/bin/bash
[ -e "$1" ] && sha256sum -c --status <(echo "$2 $1") && echo "ok" || echo "invalid"
