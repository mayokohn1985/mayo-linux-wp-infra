#!/usr/bin/env bash
set -euo pipefail

# Run WP-CLI against a WordPress container by sharing its network and volumes.
# Usage:
#   WP_CONTAINER=my_wp ./scripts/wp-cli-docker.sh plugin list

WP_CONTAINER="${WP_CONTAINER:-wordpress}"

exec docker run --rm -it \
  --network "container:${WP_CONTAINER}" \
  --volumes-from "${WP_CONTAINER}" \
  --user 33:33 \
  -e WP_CLI_CACHE_DIR=/tmp/wp-cli-cache \
  wordpress:cli "$@"
