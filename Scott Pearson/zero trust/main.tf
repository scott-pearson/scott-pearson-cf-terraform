resource "cloudflare_zero_trust_organization" "zt_org" {
  account_id                  = var.cloudflare_account_id
  allow_authenticate_via_warp = false
  auth_domain                 = "scott.cloudflareaccess.com"
  auto_redirect_to_identity   = false
  is_ui_read_only             = false
  name                        = "Scott Pearson"
  login_design = {
    background_color          = "#eee"
    text_color                = "#333"
    logo_path                 = "https://scottpearson.net/wp-content/uploads/2025/07/cf-logo-v-rgb-150x50.png"
  }
  session_duration            = "1h"
  user_seat_expiration_inactive_time = "730h"
  warp_auth_session_duration = "1h"
}

