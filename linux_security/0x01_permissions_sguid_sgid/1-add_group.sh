#!/bin/bash
sudo groupadd "$1"
sudo chgrp "$1" "$2"
sudo chmod g+xr "$2"