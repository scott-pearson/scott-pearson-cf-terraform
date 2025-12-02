resource "cloudflare_zero_trust_access_tag" "Me" {
  account_id = var.cloudflare_account_id
  name = "Me"
}
