#!/bin/bash
# Встановлення Xray
bash <(curl -L https://github.com)

# Створення конфігу в робочій папці
cat <<EOF > /workspaces/${RepositoryName:-'default'}/config.json
{
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

# Запуск
pkill xray
nohup xray run -c /workspaces/${RepositoryName:-'default'}/config.json > xray.log 2>&1 &
