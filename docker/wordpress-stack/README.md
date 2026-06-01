# WordPress Docker Stack

A simple WordPress production-style stack using:

- WordPress PHP-FPM
- MariaDB 10.11
- Redis
- Nginx with FastCGI cache

## Start

```bash
cp .env.example .env
nano .env
docker compose up -d
```

Open local test port:

```bash
curl -I http://localhost:8080
```

## WP-CLI example

```bash
WP_CONTAINER=wordpress ../../scripts/wp-cli-docker.sh plugin list
```

## Notes

This is a template. Before production use, review passwords, volumes, backups, Nginx rules, TLS termination and Cloudflare settings.
