variable acme_server_url {
  type    = string
  default = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

variable acme_private_key {
  type    = string
  default = "RSA"
}

variable acme_email_address {
  type = string

}

provider "acme" {
  server_url = var.acme_server_url
}

resource "tls_private_key" "private_key" {
  algorithm = var.acme_private_key
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.acme_email_address
}

variable "acme_domain_name" {
  type = string
}

variable "acme_cf_api_token" {
  type = string
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = var.acme_domain_name

  dns_challenge {
    provider = "cloudflare"

    config = {
      CF_API_EMAIL = var.acme_email_address
    }
  }
}
