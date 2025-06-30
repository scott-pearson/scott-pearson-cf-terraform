resource "cloudflare_dns_record" "dns_0" {
  zone_id = var.cloudflare_zone_id
  name = "scottpearson.net"
  type = "CNAME"
  comment = "apex DNS record"
  content = "lb.scottpearson.net"
  proxied = true 
  tags = ["owner:dns-team"]
  ttl = 1
}

resource "cloudflare_dns_record" "dns_1" {
  zone_id = var.cloudflare_zone_id
  name = "www.scottpearson.net"
  type = "CNAME"
  comment = "WWW DNS record"
  content = "lb.scottpearson.net"
  proxied = true 
  tags = ["owner:dns-team"]
  ttl = 1
}
