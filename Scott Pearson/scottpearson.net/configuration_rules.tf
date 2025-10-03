resource "cloudflare_ruleset" "config_rules" {
  zone_id     = cloudflare_zone.scottpearson_net_zone.id
  description = ""
  kind        = "zone"
  name        = "default"
  phase       = "http_config_settings"
  rules = [
    {
      action = "set_config"
      action_parameters = {
        ssl = "full"
      }
      description = "Disable SSL for mbamps"
      enabled = true
      expression = "(http.host contains \"mbamps.com\")"
      ref = "config_rule1"
    }
  ]
}
