resource "cloudflare_ruleset" "origin_ruleset" {
  zone_id     = cloudflare_zone.scottpearson_net_zone.id 
  name        = "default"
  phase       = "http_request_origin"
  kind        = "zone"
  description = ""
  rules = [
    {
      action            = "route"
      action_parameters = {
        host_header = "scottpearson.net"
        sni = {
          value = "scottpearson.net"
        },
        origin = {
          host = "lb.scottpearson.net"
          port = 443
        }
      }
      description = "Origin override for fallback.scottpearson.net"
      enabled     = true
      expression  = "(http.host eq \"fallback.scottpearson.net\")"
      ref         = "origin_rule1"
    }
  ]
}
