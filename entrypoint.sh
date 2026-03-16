#!/bin/sh
set -e

# Substitute placeholders in JS with actual environment variable values
sed -i "s|__PHONE_NUMBER__|${PHONE_NUMBER}|g" /srv/script.js
sed -i "s|__EMAIL__|${EMAIL}|g" /srv/script.js

# Start Caddy
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
