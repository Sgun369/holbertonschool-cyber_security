#!/bin/bash
echo "$1: $(echo -n "$2 $1" | sha256sum --check --status && echo 'OK' || echo 'invalid')"
