resource "cloudflare_turnstile_widget" "login_form" {
  account_id     = cloudflare_account.Scott_Pearson_account.id
  name           = "Login Form Widget"
  domains        = ["scottpearson.net"]
  mode           = "managed"
  region         = "world"
  bot_fight_mode = "true"
  clearance_level = "no_clearance"
}
