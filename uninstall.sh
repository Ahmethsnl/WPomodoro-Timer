#!/bin/bash
# uninstall_wpom.sh

SCRIPT_PATH="$HOME/pomodoro.sh"
ALIAS_NAME="wpom"
BASHRC="$HOME/.bashrc"
ZSHRC="$HOME/.zshrc"

sed -i "/alias $ALIAS_NAME=/d" "$BASHRC"
sed -i "/alias $ALIAS_NAME=/d" "$ZSHRC"

if [ -f "$SCRIPT_PATH" ]; then
  rm -f "$SCRIPT_PATH"
  echo "✅ $ALIAS_NAME kaldırıldı ve $SCRIPT_PATH silindi."
else
  echo "ℹ️  $SCRIPT_PATH bulunamadı."
fi

echo "🔁 Terminali yeniden başlat veya 'source ~/.bashrc' çalıştır."
