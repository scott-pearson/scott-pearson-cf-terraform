resource "cloudflare_waiting_room" "wr1" {
  zone_id                   = cloudflare_zone.scottpearson_net_zone.id 
  cookie_suffix             = "scott"
  default_template_language = "en-US"
  disable_session_renewal   = false
  host                      = "scottpearson.net"
  json_response_enabled     = false
  name                      = "wr1"
  new_users_per_minute      = 250
  path                      = "/waitingroom/"
  queue_all                 = false
  queueing_method           = "fifo"
  queueing_status_code      = 202
  session_duration          = 5
  suspended                 = false
  total_active_users        = 1000
  turnstile_action          = "log"
  turnstile_mode            = "invisible"
  cookie_attributes = {
    samesite = "auto"
    secure   = "auto"
  }
}

resource "cloudflare_waiting_room_settings" "wr_settings" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  search_engine_crawler_bypass = true
}
