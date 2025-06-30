#!/bin/bash

SCRIPT_NAME="pomodoro.sh"
HOME_DIR="$HOME"
TARGET_PATH="$HOME_DIR/$SCRIPT_NAME"

if [ ! -f "$SCRIPT_NAME" ]; then
    echo "Hata: $SCRIPT_NAME dosyası bu klasörde bulunamadı!"
    exit 1
fi

mv -f "$SCRIPT_NAME" "$TARGET_PATH"
echo "Dosya $TARGET_PATH konumuna taşındı."

BASHRC="$HOME_DIR/.bashrc"
ZSHRC="$HOME_DIR/.zshrc"

ALIAS_CMD="alias wpom='bash $TARGET_PATH'"

grep -v "^alias wpom=" "$BASHRC" 2>/dev/null > "$BASHRC.tmp" && mv "$BASHRC.tmp" "$BASHRC"
echo "$ALIAS_CMD" >> "$BASHRC"
echo "Alias wpom bashrc dosyasına eklendi."

if [ -f "$ZSHRC" ]; then
    grep -v "^alias wpom=" "$ZSHRC" 2>/dev/null > "$ZSHRC.tmp" && mv "$ZSHRC.tmp" "$ZSHRC"
    echo "$ALIAS_CMD" >> "$ZSHRC"
    echo "Alias wpom zshrc dosyasına eklendi."
fi

if [ -d ".git" ]; then
    rm -rf .git
    echo ".git dizini silindi."
fi

for file in *; do
    if [ "$file" != "install_pomodoro.sh" ]; then
        rm -rf "$file"
    fi
done
echo "Geçici dosyalar silindi, sadece ev dizininde $SCRIPT_NAME kaldı."

echo -e "\nKurulum tamamlandı! Yeni alias'ı kullanmak için terminali kapatıp aç veya şu komutu çalıştır:\n source ~/.bashrc (veya source ~/.zshrc)\n"

echo -e "\033[1;32m GitHub   ➜\033[0m  \033[4;36m ahmethsnl \033[0m"
echo -e "\033[1;32m 42 Slack ➜\033[0m  \033[4;36m ahmsanli \033[0m"
