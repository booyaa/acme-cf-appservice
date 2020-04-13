# acme-cf-appservice

A proof of concept to generate wildcard certs using the Terraform ACME provider and bind them to an Azure app service site. DNS challenge is via Cloudflare.

This is still a WIP.

Tasks

- [x] setup CF API token
- [x] setup ACME cert
- [ ] use pfx cert
- [ ] import into key vault?
- [ ] setup custom domain to app service
- [ ] bind cert to domain

## setup

### cf

- create custom api token
    - perms
        - zone > zone settings > read (may not be needed)
        - zone > zone > read
        - zone > dns > edit
    - zone restrictions
        - include > all zones

## references

- [cf dns challenge](https://www.terraform.io/docs/providers/acme/dns_providers/cloudflare.html#cf_dns_api_token)
- [worked example of tf provider](https://opencredo.com/blogs/letsencrypt-terraform/)
- [correct api perms](https://community.cloudflare.com/t/api-token-for-traefik-dns-challenge/132084/7)
    - [official provider docs](https://www.terraform.io/docs/providers/acme/dns_providers/cloudflare.html#api-tokens)
