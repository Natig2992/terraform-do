resource "digitalocean_ssh_key" "terraform-do" {
  name       = "Terraform-do"
  public_key = file("/root/.ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "www-1" {
// specify count of web-servers
  count              = 3
  image              = "ubuntu-20-04-x64"
//adding in name of droplet sequence number of "count"
  name               = "web-nginx-${count.index}"
  region             = "nyc3"
  size               = "s-2vcpu-2gb"
  private_networking = true
  ssh_keys           = [digitalocean_ssh_key.terraform-do.fingerprint]
  tags               = ["web-server-${count.index}", "nagiev2992_at_mail_ru", "linux"]
}






output "droplet_ipv4" {
//specify, thath want get list all ipv4 address from all web-servers
  value = digitalocean_droplet.www-1[*].ipv4_address
}

output "droplet_tags" {
//specify, that want get list all tags  from all web-servers
  value = digitalocean_droplet.www-1[*].tags
}


