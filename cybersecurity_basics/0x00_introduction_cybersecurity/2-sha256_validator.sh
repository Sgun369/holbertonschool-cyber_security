#!/bin/bash
echo -n "$1" | sha256sum -c <<< "$2 $1:ok"
