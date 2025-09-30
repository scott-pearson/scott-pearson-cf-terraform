resource "cloudflare_ruleset" "custom_log_fields" {
  zone_id = cloudflare_zone.scottpearson_website_zone.id
  kind = "zone"
  name = "default"
  phase = "http_log_custom_fields"
  rules = [
    {
      action = "log_custom_field"
      action_parameters = {
        transformed_request_fields = [
          {
            name = "cf-worker"
          }
        ]
      }
      description = "Set Logpush custom fields for HTTP requests"
      enabled = true
      expression = "true"
    }
  ]
}
