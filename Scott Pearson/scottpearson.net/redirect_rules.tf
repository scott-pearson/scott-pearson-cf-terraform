resource "cloudflare_ruleset" "redirect_rules" {
  zone_id     = cloudflare_zone.scottpearson_net_zone.id
  description = ""
  kind        = "zone"
  name        = "default"
  phase       = "http_request_dynamic_redirect"
  rules = [
    {
      action = "redirect"
      action_parameters = {
        from_value = {
          target_url = {
            expression = "regex_replace(http.request.uri, \"^/bob(.*)$\", \"/?bob$${1}\")"
          }
          preserve_query_string = false
          status_code           = 301
        }
      }
      description = "Redirect Bob to / and append to query string"
      enabled = true
      expression = "(http.request.uri.path matches \"^/bob[^/]*$\")"
      ref = "redirect_rule1"
    }
  ]
}
