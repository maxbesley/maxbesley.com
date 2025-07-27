# Build image with: docker build . --tag webserver

docker run --detach --rm --name server -p 443:443 -p 80:80 -v /var/www/personal-website/_site:/srv -v /etc/ssl/certs:/etc/ssl/certs -v /etc/ssl/private:/etc/ssl/private -v /caddy_data:/data ghcr.io/maxbesley/webserver:latest
