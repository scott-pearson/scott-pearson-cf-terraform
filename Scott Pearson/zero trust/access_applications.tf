resource "cloudflare_zero_trust_access_application" "access_application" {
  account_id          = var.cloudflare_account_id
  name                = "Wordpress Login"
  type                = "self_hosted"
  domain              = "scottpearson.net/wp-admin"
  destinations = [
    {
      type = "public"
      uri  = "scottpearson.net/wp-admin"
    }
  ]
  app_launcher_visible = true
  allowed_idps         = [
    cloudflare_zero_trust_access_identity_provider.github_idp.id,
    cloudflare_zero_trust_access_identity_provider.otp_idp.id
  ]
  tags                      = []
  auto_redirect_to_identity = false
  policies                  = [
    {
      id       = cloudflare_zero_trust_access_policy.allow_emails_access_policy.id
      precedence       = 1
    }
  ]
  session_duration           = "24h"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  options_preflight_bypass   = false
}
