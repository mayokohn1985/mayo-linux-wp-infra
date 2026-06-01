# Monitoring Stack

Uptime Kuma stack for basic service monitoring.

## Start

```bash
docker compose up -d
```

## Reverse proxy idea

Expose it behind Nginx or Cloudflare Tunnel and protect it with authentication.

Recommended monitors:

- HTTPS status for production sites
- WordPress login page availability
- WooCommerce checkout test endpoint if available
- Server ping / TCP port
- Backup job heartbeat
