terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
variable do_token {
    default = "65f2f423c9de423a869f023b843bb72a808161ba32b6a2cf9edb8f6ce9ec8c65"
    type = string
    description = "Token for Rebrain LNXA"

}
variable pvt_key {
    default = "/root/.ssh/id_rsa"
    type = string

}

provider "digitalocean" {
  token = var.do_token
}
