#!/bin/bash
find / -type d -perm -0002 ! -path "/proc/*" ! -path "/sys*" ! -path "/dev/*"