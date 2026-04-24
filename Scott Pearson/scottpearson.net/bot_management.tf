resource "cloudflare_bot_management" "bot_management" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  ai_bots_protection = "disabled"
  bm_cookie_enabled = true
  auto_update_model = true
  crawler_protection = "enabled"
  enable_js = true
  is_robots_txt_managed = true
  suppress_session_score = false
}
