FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY index.html /srv/index.html
COPY privacy-policy.html /srv/privacy-policy.html
COPY style.css  /srv/style.css
COPY script.js  /srv/script.js
COPY en/index.html /srv/en/index.html
COPY ro/index.html /srv/ro/index.html
COPY sitemap.xml /srv/sitemap.xml
COPY public/    /srv/public/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
