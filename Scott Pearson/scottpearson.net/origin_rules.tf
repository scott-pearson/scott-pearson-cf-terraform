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
    },
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
      description = "Origin override for test2.scottpearson.website based on custom metadata field"
      enabled     = true
      expression  = "(lookup_json_string(cf.hostname.metadata, \"customer_id\") eq \"12345\")"
      ref         = "origin_rule2"
    }
  ]
}
