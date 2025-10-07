resource "cloudflare_zero_trust_gateway_certificate" "gw_cert" {
  account_id = var.cloudflare_account_id
  # Marking this as comment because it's already activate and created via UI so it doesn't like this
  #  activate   = true
}
