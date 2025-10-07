resource "cloudflare_zero_trust_gateway_policy" "gw_policy1" {
  account_id    = var.cloudflare_account_id
  action        = "off"
  description   = "Bypass HTTPS decryption of Microsoft 365 traffic"
  enabled       = true
  filters       = ["http"]
  name          = "Do Not Inspect Microsoft 365"
  precedence    = 20000
  traffic       = "any(app.ids[*] in {626 594 635 514 601 596 597 680})"
  rule_settings = {}
}

