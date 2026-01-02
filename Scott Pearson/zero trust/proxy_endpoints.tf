resource "cloudflare_zero_trust_gateway_proxy_endpoint" "squid_bridge" {
  account_id = var.cloudflare_account_id
  ips        = ["104.248.162.62/32", "2a03:b0c0:1:e0::8b3d:3001/64"]
  kind       = "ip"
  name       = "Squid Bridge"
}
