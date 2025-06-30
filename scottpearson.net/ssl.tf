resource "cloudflare_certificate_pack" "advanced_ssl" {
  zone_id = var.cloudflare_zone_id
  certificate_authority = "google"
  hosts = ["scottpearson.net", "*.scottpearson.net"]
  type = "advanced"
  validation_method = "txt"
  validity_days = 90
  cloudflare_branding = false
}
