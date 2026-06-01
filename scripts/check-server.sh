#!/usr/bin/env bash
set -euo pipefail

echo "== Host =="
hostnamectl || true

printf "\n== Disk ==\n"
df -h

printf "\n== Memory ==\n"
free -h

printf "\n== Listening ports ==\n"
ss -tulpn

printf "\n== Docker containers ==\n"
docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}' || true

printf "\n== UFW ==\n"
ufw status verbose || true
