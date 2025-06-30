#!/bin/bash

SCRIPT_NAME="pomodoro.sh"
REPO_NAME="WPomodoro-Timer"
HOME_DIR="$HOME"
TARGET_PATH="$HOME_DIR/$SCRIPT_NAME"

# Öncelikle dosya var mı kontrol et
if [ ! -f "$SCRIPT_NAME" ]; then
    echo "Hata: $SCRIPT_NAME dosyası bu klasörde bulunamadı!"
    exit 1
fi

# Dosyayı ev dizinine taşı
mv -f "$SCRIPT_NAME" "$TARGET_PATH"
echo "Dosya $TARGET_PATH konumuna taşındı."

BASHRC="$HOME_DIR/.bashrc"
ZSHRC="$HOME_DIR/.zshrc"

ALIAS_CMD="alias wpom='bash $TARGET_PATH'"

# Alias varsa temizle, sonra ekle
grep -v "^alias wpom=" "$BASHRC" 2>/dev/null > "$BASHRC.tmp" && mv "$BASHRC.tmp" "$BASHRC"
echo "$ALIAS_CMD" >> "$BASHRC"
echo "Alias wpom bashrc dosyasına eklendi."

if [ -f "$ZSHRC" ]; then
    grep -v "^alias wpom=" "$ZSHRC" 2>/dev/null > "$ZSHRC.tmp" && mv "$ZSHRC.tmp" "$ZSHRC"
    echo "$ALIAS_CMD" >> "$ZSHRC"
    echo "Alias wpom zshrc dosyasına eklendi."
fi

# Bulunduğun dizin, repo klasörünün içi
CURRENT_DIR="$(pwd)"

# Bir üst dizine çık
cd ..

# Repo klasörünü komple sil
if [ -d "$REPO_NAME" ]; then
    rm -rf "$REPO_NAME"
    echo "$REPO_NAME klasörü komple silindi."
else
    echo "$REPO_NAME klasörü bulunamadı."
fi

echo -e "\nKurulum tamamlandı! Yeni alias'ı kullanmak için terminali kapatıp aç veya şu komutu çalıştır:\n source ~/.bashrc (veya source ~/.zshrc)\n"

echo -e "\033[1;32m GitHub   ➜\033[0m  \033[4;36m ahmethsnl \033[0m"
echo -e "\033[1;32m 42 Slack ➜\033[0m  \033[4;36m ahmsanli \033[0m"
