terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

# Create a new SSH key
resource "digitalocean_ssh_key" "pub_key" {
  name       = "Personal Website Key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-24-04-x64"
  name   = "web-server"
  region = "sfo3"
  size   = "s-1vcpu-0.5gb"
  ssh_keys = [digitalocean_ssh_key.pub_key.id]
}

data "digitalocean_account" "account_info" {}
output "my_info" {
  value = data.digitalocean_account.account_info
}

output "server_ip" {
  value = digitalocean_droplet.web.ipv4_address
}

