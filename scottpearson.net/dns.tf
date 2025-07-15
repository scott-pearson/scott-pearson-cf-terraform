resource "cloudflare_zone_dns_settings" "scott_pearson_net_dns_settings" {
  zone_id = var.cloudflare_zone_id
  flatten_all_cnames = false
  foundation_dns = false
  multi_provider = false
  internal_dns = {}
  nameservers = {
    type = "custom.account"
    ns_set = 1
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

resource "cloudflare_dns_record" "dns_0" {
  zone_id = var.cloudflare_zone_id
  name = "scottpearson.net"
  type = "CNAME"
  content = "lb.scottpearson.net"
  proxied = true 
  ttl = 1
}

resource "cloudflare_dns_record" "dns_1" {
  zone_id = var.cloudflare_zone_id
  name = "www.scottpearson.net"
  type = "CNAME"
  content = "lb.scottpearson.net"
  proxied = true
  ttl = 1
}

resource "cloudflare_dns_record" "dns_2" {
  zone_id = var.cloudflare_zone_id
  name = "fallback.scottpearson.net"
  type = "CNAME"
  content = "lb.scottpearson.net"
  proxied = true 
  ttl = 1
}
