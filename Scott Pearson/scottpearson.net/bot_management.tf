resource "cloudflare_bot_management" "bot_management" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  ai_bots_protection = "disabled"
  auto_update_model = true
  crawler_protection = "disabled"
  enable_js = true
  is_robots_txt_managed = true
  suppress_session_score = false
}
