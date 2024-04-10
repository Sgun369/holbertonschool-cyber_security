#!/bin/bash
ps aux | awk '$6 > 0 && $7 > 0 {print $0}'