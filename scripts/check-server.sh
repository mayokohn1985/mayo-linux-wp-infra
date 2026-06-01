#!/usr/bin/env bash
set -euo pipefail

echo "== Host =="
hostnamectl || true

echo "\n== Disk =="
df -h

echo "\n== Memory =="
free -h

echo "\n== Listening ports =="
ss -tulpn

echo "\n== Docker containers =="
docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}' || true

echo "\n== UFW =="
ufw status verbose || true
