resource "cloudflare_dns_record" "dns_0" {
  zone_id = cloudflare_zone.scottpearson_website_zone.id
  name = "scottpearson.website"
  type = "A"
  content = "104.248.162.62"
  proxied = true 
  ttl = 1
}

resource "cloudflare_dns_record" "dns_1" {
  zone_id = cloudflare_zone.scottpearson_website_zone.id
  name = "www.scottpearson.website"
  type = "CNAME"
  content = "scottpearson.website"
  proxied = true
  ttl = 1
}

resource "cloudflare_dns_record" "dns_2" {
  zone_id = cloudflare_zone.scottpearson_website_zone.id
  name = "test.scottpearson.website"
  type = "CNAME"
  content = "scottpearson.website"
  proxied = true
  ttl = 1
}
