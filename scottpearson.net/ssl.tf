resource "cloudflare_certificate_pack" "advanced_ssl" {
  zone_id = var.cloudflare_zone_id
  certificate_authority = "google"
  hosts = ["scottpearson.net", "*.scottpearson.net"]
  type = "advanced"
  validation_method = "txt"
  validity_days = 90
  cloudflare_branding = false
}

# Bug with this but able to workaround for now - https://github.com/cloudflare/terraform-provider-cloudflare/issues/5714
resource "cloudflare_authenticated_origin_pulls_certificate" "aop_certificate" {
  zone_id = var.cloudflare_zone_id
  certificate = var.aop_cert  
  private_key = var.aop_key
}

resource "cloudflare_authenticated_origin_pulls_settings" "aop_setting" {
  zone_id = var.cloudflare_zone_id
  enabled = true
}
