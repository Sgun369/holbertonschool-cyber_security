#!/bin/bash
curl -X POST -d "$1" -H "HOST: $1" "$2"
