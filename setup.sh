#!/bin/bash

# Оновлюємо систему та встановлюємо Xray
bash <(curl -L https://github.com)

# Створюємо конфіг з вашим UUID
cat <<EOF > /workspaces/config.json
{
  "log": {"loglevel": "info"},
  "inbounds": [{
    "port": 8080,
    "protocol": "vless",
    "settings": {
      "clients": [{"id": "9ebbcab2-d876-4486-845e-13b81b14fe53"}],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {"path": "/"}
    }
  }],
  "outbounds": [{"protocol": "freedom"}]
}
EOF

# Запускаємо сервер
nohup xray run -c /workspaces/config.json > /workspaces/xray.log 2>&1 &

echo "------------------------------------------------"
echo "СЕРВЕР ГОТОВИЙ!"
echo "UUID: 9ebbcab2-d876-4486-845e-13b81b14fe53"
echo "Порт: 8080"
echo "------------------------------------------------"
