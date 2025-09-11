# Bug with this but able to workaround for now - https://github.com/cloudflare/terraform-provider-cloudflare/issues/5714
resource "cloudflare_authenticated_origin_pulls_certificate" "aop_certificate" {
  zone_id = cloudflare_zone.scottpearson_website_zone.id
  certificate = var.aop_cert
  private_key = var.aop_key
}

resource "cloudflare_authenticated_origin_pulls_settings" "aop_setting" {
  zone_id = cloudflare_zone.scottpearson_website_zone.id
  enabled = true
}
