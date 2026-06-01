#!/usr/bin/env bash
set -euo pipefail

# Simple Docker WordPress backup script.
# Expects DB container, DB credentials and WordPress volume path.

BACKUP_DIR="${BACKUP_DIR:-./backups}"
DB_CONTAINER="${DB_CONTAINER:-wordpress_db}"
DB_NAME="${DB_NAME:-wordpress}"
DB_USER="${DB_USER:-wordpress}"
DB_PASSWORD="${DB_PASSWORD:?Set DB_PASSWORD}"
WP_PATH="${WP_PATH:-./wordpress}"
STAMP="$(date +%F-%H%M%S)"

mkdir -p "$BACKUP_DIR"

docker exec "$DB_CONTAINER" sh -c \
  "mariadb-dump -u'$DB_USER' -p'$DB_PASSWORD' '$DB_NAME'" \
  | gzip > "$BACKUP_DIR/db-$STAMP.sql.gz"

tar -czf "$BACKUP_DIR/wp-files-$STAMP.tar.gz" "$WP_PATH"

echo "Backup created in $BACKUP_DIR"
