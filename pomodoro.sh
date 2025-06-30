#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_focus_art() {
cat << "EOF"
   ______           _             
__        __              
\ \      / /__  ___  __ _ 
 \ \ /\ / / _ \/ __|/ _` |
  \ V  V /  __/\__ \ (_| |
   \_/\_/ \___||___/\__,_|
EOF
}

print_break_art() {
cat << "EOF"
  __  __       _       
 |  \/  |     (_)      
 | \  / | __ _ _ _ __  
 | |\/| |/ _` | | '_ \ 
 | |  | | (_| | | | | |
 |_|  |_|\__,_|_|_| |_| 
EOF
}

print_goodbye_art() {
cat << "EOF"
   ____                 _ _                
  / ___| ___   ___   __| | |__  _   _  ___ 
 | |  _ / _ \ / _ \ / _` | '_ \| | | |/ _ \
 | |_| | (_) | (_) | (_| | |_) | |_| |  __/
  \____|\___/ \___/ \__,_|_.__/ \__, |\___|
                                 __/ |     
                                |___/      
EOF
}

countdown() {
    local total_seconds=$1
    while [ $total_seconds -gt 0 ]; do
        mins=$((total_seconds / 60))
        secs=$((total_seconds % 60))
        printf "\r%02d:%02d kaldı...  " $mins $secs
        sleep 1
        ((total_seconds--))
    done
    echo ""
}

pomodoro_count=0
total_focus_time=0

while true; do
    ((pomodoro_count++))

    clear
    echo -e "${GREEN}"
    print_focus_art
    echo -e "🍅 Pomodoro #$pomodoro_count başladı: 25 dakika odaklan.${NC}"
    countdown $((25 * 60))
    ((total_focus_time += 25))

    clear
    echo -e "${CYAN}"
    print_break_art
    echo -e "⏸️  Mola zamanı: 5 dakika dinlen.${NC}"
    countdown $((5 * 60))

    total_minutes=$((total_focus_time))
    total_hours=$(awk "BEGIN {printf \"%.2f\", $total_minutes/60}")

    echo -e "${YELLOW}"
    echo "✅ Tamamlanan Seans: $pomodoro_count"
    echo "⏱️  Toplam Odak Süresi: ${total_minutes} dakika (~${total_hours} saat)"
    echo -e "${YELLOW}🔁 Devam etmek istiyor musun? (e/h)${NC}"
    read -r answer

    if [[ "$answer" != "e" && "$answer" != "E" ]]; then
        echo -e "${RED}"
        print_goodbye_art
        echo -e "${CYAN}👋 Görüşürüz. Toplam $pomodoro_count seans tamamladın. ${NC}"
        break
    fi
done
