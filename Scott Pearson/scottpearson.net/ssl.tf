resource "cloudflare_custom_ssl" "custom_ssl" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  certificate = var.custom_cert 
  private_key = var.custom_key
  bundle_method = "ubiquitous"
  geo_restrictions = {
    label = "highest_security"
  }
  type = "legacy_custom"
}

resource "cloudflare_certificate_pack" "advanced_ssl" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  certificate_authority = "google"
  hosts = ["scottpearson.net", "*.scottpearson.net"]
  type = "advanced"
  validation_method = "txt"
  validity_days = 90
  cloudflare_branding = false
}

resource "cloudflare_authenticated_origin_pulls_certificate" "aop_certificate" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  certificate = var.aop_cert  
  private_key = var.aop_key
}

resource "cloudflare_authenticated_origin_pulls_settings" "aop_setting" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  enabled = true
}

# For hostname specific AOP
#resource "cloudflare_authenticated_origin_pulls" "scottpearson_net" {
#  zone_id = cloudflare_zone.scottpearson_net_zone.id
#  config = [
#    {
#      cert_id = "e16f9ebb-c2ff-4e80-afce-7d5b897bd8d6" 
#      enabled = true
#      hostname = "scottpearson.net"
#    }
#  ]
#}
