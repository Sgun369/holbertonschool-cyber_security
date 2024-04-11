#!/bin/bash
echo "$1: $(sha256sum -c <<< "$2 $1" | cut -d: -f2)"
