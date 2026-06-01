# Server Hardening Checklist

## Access

- [ ] SSH on non-standard port if desired
- [ ] SSH key-only login
- [ ] Root login disabled
- [ ] Separate sudo user
- [ ] Password login disabled

## Firewall

- [ ] Default deny incoming
- [ ] Allow SSH port
- [ ] Allow HTTP/HTTPS
- [ ] Expose only necessary ports

## Updates

- [ ] System updated
- [ ] Docker installed from official repository
- [ ] Reboot after kernel update

## WordPress

- [ ] File editor disabled
- [ ] XML-RPC blocked if not needed
- [ ] Upload PHP execution blocked
- [ ] Debug log not public
- [ ] Admin protected by 2FA or additional access control

## Backups

- [ ] Database backup tested
- [ ] Files backup tested
- [ ] Restore procedure tested
- [ ] Off-server backup storage

## Monitoring

- [ ] Uptime monitor
- [ ] Disk usage monitor
- [ ] SSL expiration monitor
- [ ] Backup heartbeat
