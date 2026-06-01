# Cloudflare Notes for WordPress

## Recommended baseline

- DNS proxied through Cloudflare where appropriate
- SSL/TLS mode: Full strict when origin certificate is valid
- Do not cache dynamic WooCommerce pages
- Exclude checkout, cart and my-account from aggressive caching
- Use Turnstile for forms/login if needed
- Protect admin endpoints with extra rules where appropriate

## Never cache

- `/wp-admin/*`
- `/wp-login.php`
- `/cart/*`
- `/checkout/*`
- `/my-account/*`
- `*wc-ajax*`

## Useful headers to inspect

```bash
curl -I https://example.com
```

Look for:

- `server: cloudflare`
- `cf-cache-status`
- `x-fastcgi-cache`
- security headers
