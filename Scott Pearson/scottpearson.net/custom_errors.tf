resource "cloudflare_ruleset" "error_rules" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  kind = "zone"
  name = "default"
  phase = "http_custom_errors"
  rules = [
    {
      action = "serve_error"
      action_parameters = {
        content      = "{\n  \"status\": 404,\n  \"error\": \"Not Found\",\n  \"message\": \"The requested resource could not be found.\"\n}"
        content_type = "application/json"
        status_code  = 404
      }
      description = "Custom Error For 404"
      enabled     = true
      expression  = "(http.response.code eq 404)"
      ref         = "error_rule1"
    }
  ]
}    
