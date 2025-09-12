resource "cloudflare_account_dns_settings" "Scott_Pearson_account_dns_settings" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  zone_defaults = {
    flatten_all_cnames = false
    foundation_dns = false
    multi_provider = false
    internal_dns = {}
    nameservers = {
      type = "custom.account"
    }
    soa = {
      expire = 604800
      min_ttl = 1800
      mname = "ns1.scottpearson.net"
      refresh = 10000
      retry = 2400
      rname = "scott.cloudflare.com"
      ttl = 3600
    }
    secondary_overrides = false
    ns_ttl = 86400 
    zone_mode = "standard"
  }
}
