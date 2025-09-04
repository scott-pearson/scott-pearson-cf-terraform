resource "cloudflare_bot_management" "bot_management" {
  zone_id = var.cloudflare_zone_id
  ai_bots_protection = "disabled"
  auto_update_model = true
  crawler_protection = "disabled"
  enable_js = false
  is_robots_txt_managed = true
  suppress_session_score = false
}
