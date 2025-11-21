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
      description = "Full SSL for mbamps subdomain"
      enabled = true
      expression = "(http.host contains \"mbamps.com\")"
      ref = "config_rule1"
    },
    {
      action = "set_config"
      action_parameters = {
        ssl = "full"
      }
      description = "Full SSL for test subdomains"
      enabled = true
      expression = "(http.host contains \"test\")"
      ref = "config_rule2"
    },
    {
      action = "set_config"
      action_parameters = {
        ssl = "flexible"
      }
      description = "Flexible SSL for api-tunnel subdomain"
      enabled = true
      expression = "(http.host eq \"tunnel-api.scottpearson.net\")"
      ref = "config_rule3"
    }
  ]
}
