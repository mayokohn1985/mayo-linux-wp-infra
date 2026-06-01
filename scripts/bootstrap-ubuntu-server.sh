#!/usr/bin/env bash
set -euo pipefail

# Ubuntu server bootstrap for a small production VPS.
# Run as root or via sudo.

if [[ $EUID -ne 0 ]]; then
  echo "Run this script as root or with sudo."
  exit 1
fi

SSH_PORT="${SSH_PORT:-2222}"
ADMIN_USER="${ADMIN_USER:-mayo}"

apt update
apt -y upgrade
apt install -y \
  curl \
  wget \
  git \
  ufw \
  fail2ban \
  ca-certificates \
  gnupg \
  lsb-release \
  htop \
  unzip \
  rsync

if ! id "$ADMIN_USER" >/dev/null 2>&1; then
  adduser --disabled-password --gecos "" "$ADMIN_USER"
  usermod -aG sudo "$ADMIN_USER"
fi

# SSH hardening baseline. Review before running on remote systems.
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup.$(date +%F-%H%M%S)
sed -i "s/^#\?Port .*/Port ${SSH_PORT}/" /etc/ssh/sshd_config
sed -i "s/^#\?PasswordAuthentication .*/PasswordAuthentication no/" /etc/ssh/sshd_config
sed -i "s/^#\?PermitRootLogin .*/PermitRootLogin no/" /etc/ssh/sshd_config

systemctl reload ssh || systemctl reload sshd

ufw default deny incoming
ufw default allow outgoing
ufw allow "${SSH_PORT}/tcp"
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable

systemctl enable fail2ban
systemctl restart fail2ban

echo "Bootstrap finished. Verify SSH access before closing this terminal."
