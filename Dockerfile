FROM nginx:1.27-alpine-slim

LABEL author="Max Besley" \
      maintainer="besleymax@gmail.com" \
      description="For containerizing my nginx server"

COPY ./infra/nginx/personal-website.conf /etc/nginx/conf.d/

EXPOSE 443

