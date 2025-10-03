resource "cloudflare_ruleset" "rewrite_ruleset" {
  zone_id     = cloudflare_zone.scottpearson_net_zone.id 
  name        = "default"
  phase       = "http_request_transform"
  kind        = "zone"
  description = ""
  rules = [
    {
      action            = "rewrite"
      action_parameters = {
        uri = {
          path = {
            value = "/"
          },
          query = {
            value = "test=1"
          }
        }
      }
      description       = "Rewrite Test Path"
      expression        = "(http.request.uri.path matches r\"^/test[^/]*$\")"
      enabled           = true
      ref               = "rewrite_rule1"
    }
  ]
}
