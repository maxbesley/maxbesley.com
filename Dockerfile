FROM caddy:2.10-alpine

LABEL author="Max Besley" \
      maintainer="besleymax@gmail.com" \
      description="For containerizing my Caddy server"

COPY ./infra/caddy/Caddyfile /etc/caddy/

EXPOSE 443 80
