# WP-CLI Operations

## Plugin list

```bash
WP_CONTAINER=wordpress ./scripts/wp-cli-docker.sh plugin list
```

## Update plugins

```bash
WP_CONTAINER=wordpress ./scripts/wp-cli-docker.sh plugin update --all
```

## Check core update

```bash
WP_CONTAINER=wordpress ./scripts/wp-cli-docker.sh core check-update
```

## Flush cache

```bash
WP_CONTAINER=wordpress ./scripts/wp-cli-docker.sh cache flush
```

## Redis status

```bash
WP_CONTAINER=wordpress ./scripts/wp-cli-docker.sh redis status
```

## Disable plugin auto-updates

```bash
WP_CONTAINER=wordpress ./scripts/wp-cli-docker.sh plugin auto-updates disable --all
```
