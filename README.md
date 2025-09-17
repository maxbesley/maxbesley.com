# My Website

The source code for my [personal website](https://maxbesley.com).
Built with the [Lume](https://lume.land) static site generator.


## Build locally

To locally build and view the website run `deno task serve`
and then go to `https://localhost:3000/`.


## Deploy

Do the following:

1. Set up a Linux VPS with [this Ansible playbook](https://github.com/maxbesley/vps-config).

2. On the VPS place your Cloudflare Origin CA certificate and private key in the
   files `/etc/ssl/certs/certificate.pem` and `/etc/ssl/private/key.pem`, respectively.

3. In the GitHub repo go to `Settings -> Secrets and variables -> Actions` and create the four
   required repository secrets for the [SSH GitHub Action](https://github.com/appleboy/ssh-action).

4. Manually run the "*Deploy HTML/CSS files to the webserver*" and
   "*Deploy web server Docker image*" workflows through GitHub's website.

6. Verify that the deployment worked using [curl](https://curl.se) and a web browser.

Alternatively you can use [GitHub Pages](https://docs.github.com/en/pages)
or [Cloudflare Pages](https://pages.cloudflare.com) instead.
