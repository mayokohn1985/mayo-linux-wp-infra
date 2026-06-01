# Incident Debugging Flow

When production WordPress/WooCommerce breaks, do not guess. Follow the layers.

## 1. DNS and Cloudflare

```bash
dig example.com
curl -I https://example.com
```

Check Cloudflare status, DNS target and SSL mode.

## 2. Nginx reverse proxy

```bash
sudo nginx -t
sudo tail -n 100 /var/log/nginx/error.log
```

If using Dockerized proxy:

```bash
docker logs --tail=100 proxy_nginx
```

## 3. PHP / WordPress container

```bash
docker ps
docker logs --tail=100 wordpress
```

## 4. WordPress application

```bash
WP_CONTAINER=wordpress ./scripts/wp-cli-docker.sh plugin list
WP_CONTAINER=wordpress ./scripts/wp-cli-docker.sh theme list
WP_CONTAINER=wordpress ./scripts/wp-cli-docker.sh option get siteurl
```

## 5. WooCommerce specific

Check:

- WooCommerce status logs
- Payment gateway logs
- Failed webhook/callbacks
- Recent plugin/theme updates
- Checkout errors in browser console

## 6. Database and Redis

```bash
docker logs --tail=100 wordpress_db
docker logs --tail=100 wordpress_redis
```

## Rule

Find the failing layer first. Then fix the root cause.
