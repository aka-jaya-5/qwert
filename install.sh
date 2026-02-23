#!/bin/bash
# Pastikan skrip ini executable: chmod +x install.sh

# --- bagian instalasi lainnya ---
# misal update, install docker, clone repo, dsb.
apt update -y
apt install -y docker.io

# Pastikan Docker jalan
systemctl enable docker
systemctl start docker

# --- Jalankan Honeygain container ---
docker run -d \
  --restart unless-stopped \
  --name honeygain \
  honeygain/honeygain \
  -tou-accept \
  -email "qorisas@gmail.com" \
  -pass "pQwbr00shn123" \
  -device "minipc-$(hostname)-$(date +%s)" \
  > /root/honeygain.log 2>&1 &

echo "Honeygain container sudah berjalan. Log: /root/honeygain.log"
