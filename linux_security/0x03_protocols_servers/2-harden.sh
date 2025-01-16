#!/bin/bash
find / -type d -perm -0002 -xdev ! -path "/proc/*" ! -path "/sys*" ! -path "/dev/*"