# Mayo Linux WP Infra

Linux, Docker, Nginx and WordPress infrastructure toolkit.

## About

I'm a WordPress and WooCommerce specialist with a growing focus on Linux infrastructure, automation and hosting environments.

This repository contains scripts, configurations and notes collected while building and maintaining Linux servers, Docker environments, WordPress stacks and monitoring solutions.

## Topics

* Linux administration
* Docker
* Nginx
* WordPress infrastructure
* Monitoring
* Security hardening
* Bash scripting
* GitHub Actions

## Repository Structure

* `scripts/` - Bash automation and maintenance scripts
* `nginx/` - Nginx snippets and example configurations
* `docker/` - Docker Compose stacks and examples
* `docs/` - Notes, checklists and operational documentation

## Goal

The goal of this repository is to document practical Linux and hosting knowledge through real-world examples and reusable configurations.



# Mayo Linux WP Infra

Production-oriented Linux + WordPress infrastructure snippets, scripts and Docker examples.

This repository contains practical building blocks for running WordPress/WooCommerce on a Linux server with Docker, Nginx, MariaDB, Redis, Cloudflare and basic hardening.

> Goal: show real infrastructure thinking, not just WordPress clicking.

## What is included

```text
scripts/                  Server bootstrap and maintenance scripts
nginx/snippets/           Reusable Nginx security/cache snippets
nginx/sites-available/    Example reverse proxy vhosts
docker/wordpress-stack/   Docker Compose WordPress stack
docker/monitoring-stack/  Uptime Kuma monitoring stack
docs/                     Operational notes and checklists
```

## Target stack

- Ubuntu LTS
- Docker + Docker Compose
- Nginx reverse proxy
- WordPress PHP-FPM container
- MariaDB
- Redis object cache
- Cloudflare in front
- UFW firewall
- SSH key-only access
- Uptime Kuma monitoring

## Repository philosophy

This repo is intentionally simple and readable. It is not a universal hosting panel. It is a documented infrastructure toolkit for small and medium WordPress/WooCommerce production sites.

## Quick start

Clone the repository:

```bash
git clone https://github.com/YOUR-USERNAME/mayo-linux-wp-infra.git
cd mayo-linux-wp-infra
```

Copy environment example:

```bash
cp docker/wordpress-stack/.env.example docker/wordpress-stack/.env
```

Edit values:

```bash
nano docker/wordpress-stack/.env
```

Start the WordPress stack:

```bash
cd docker/wordpress-stack
docker compose up -d
```

## Security warning

Never commit real passwords, API keys, SSH private keys, `.env` files, database dumps, production certificates or client data.

This repo contains examples and templates only.

## Typical use cases

- New VPS bootstrap
- WordPress Docker deployment
- Reverse proxy configuration
- Basic WordPress hardening
- Monitoring setup
- Reusable WP-CLI maintenance workflows

## Author

Built by Mayo Kohn as a practical Linux + WordPress infrastructure portfolio repository.
