resource "cloudflare_dns_record" "dns_0" {
  zone_id = cloudflare_zone.test_scottpearson_website_zone.id
  name = "test.scottpearson.website"
  type = "A"
  content = "104.248.162.62"
  proxied = true 
  ttl = 1
}
