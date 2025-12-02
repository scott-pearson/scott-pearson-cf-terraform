resource "cloudflare_zero_trust_access_application" "app_launcher" {
  account_id                   = var.cloudflare_account_id
  allowed_idps                 = [cloudflare_zero_trust_access_identity_provider.github_idp.id, cloudflare_zero_trust_access_identity_provider.otp_idp.id]
  auto_redirect_to_identity    = false
  domain                       = "scott.cloudflareaccess.com"
  name                         = "App Launcher"
  session_duration             = "24h"
  skip_app_launcher_login_page = false
  type                         = "app_launcher"
  landing_page_design          = {}
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.allow_emails_access_policy.id
      precedence = 1
    }
  ]
}

resource "cloudflare_zero_trust_access_application" "warp_application" {
  account_id                = var.cloudflare_account_id
  allowed_idps              = [cloudflare_zero_trust_access_identity_provider.github_idp.id, cloudflare_zero_trust_access_identity_provider.otp_idp.id]
  auto_redirect_to_identity = false
  domain                    = "scott.cloudflareaccess.com/warp"
  name                      = "Warp Login App"
  session_duration          = "24h"
  tags                      = []
  type                      = "warp"
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.allow_emails_access_policy.id
      precedence = 1
    }
  ]
}

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
  allowed_idps         = []
  tags                      = ["Me"]
  auto_redirect_to_identity = false
  policies                  = [
    {
      id               = cloudflare_zero_trust_access_policy.allow_emails_access_policy.id
      precedence       = 1
    }
  ]
  session_duration           = "24h"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  options_preflight_bypass   = false
}

resource "cloudflare_zero_trust_access_application" "intranet_application" {
  account_id          = var.cloudflare_account_id
  name                = "Intranet Login"
  type                = "self_hosted"
  domain              = "scottpearson.net/intranet"
  destinations = [
    {
      type = "public"
      uri  = "scottpearson.net/intranet"
    }
  ]
  app_launcher_visible = true
  allowed_idps         = []
  tags                      = ["Me"]
  auto_redirect_to_identity = false
  policies                  = [
    {
      id               = cloudflare_zero_trust_access_policy.allow_gateway_access_policy.id
      precedence       = 1
    }
  ]
  session_duration           = "24h"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  options_preflight_bypass   = false
}

