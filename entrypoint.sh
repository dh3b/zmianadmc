#!/bin/sh
set -e

# Substitute placeholders in JS with actual environment variable values
sed -i "s|__PHONE_NUMBER__|${PHONE_NUMBER}|g" /srv/script.js
sed -i "s|__EMAIL__|${EMAIL}|g" /srv/script.js

# Substitute domain placeholder in HTML, sitemap and robots.txt
sed -i "s|__SITE_DOMAIN__|${SITE_DOMAIN}|g" /srv/index.html
sed -i "s|__SITE_DOMAIN__|${SITE_DOMAIN}|g" /srv/en/index.html
sed -i "s|__SITE_DOMAIN__|${SITE_DOMAIN}|g" /srv/ro/index.html
sed -i "s|__SITE_DOMAIN__|${SITE_DOMAIN}|g" /srv/sitemap.xml
sed -i "s|__SITE_DOMAIN__|${SITE_DOMAIN}|g" /srv/public/robots.txt

# Start Caddy
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
