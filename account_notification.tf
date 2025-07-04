resource "cloudflare_notification_policy" "aop_cert_notification" {
  account_id = var.cloudflare_account_id
  alert_type = "zone_aop_custom_certificate_expiration_type"
  enabled = true
  mechanisms = {
    email = [{
      id = "scott@cloudflare.com"
    }]
  }
  name = "Zone Level AOP Certificate Expiry"
  description = "This alert is for AOP cert expiry, upload a renewed certificate to use for zone-level AOP"
}
