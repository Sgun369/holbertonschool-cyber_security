john --wordlist=/usr/share/wordlists/rockyou.txt --format=NT "$1" && john --show "$1" | grep -v -e '^$' | awk -F: '{print $2}' >> 4-password.txt
