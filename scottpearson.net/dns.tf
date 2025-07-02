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
