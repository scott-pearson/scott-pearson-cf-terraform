resource "cloudflare_ruleset" "rate_limits" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  kind = "zone"
  name = "default"
  phase = "http_ratelimit"
  rules = [
    {
      action = "block"
      description = "Rate Limit by user (JWT)"
      enabled = true
      expression = "(http.host eq \"api.scottpearson.net\" and any(http.request.headers.names[*] eq \"jwt-auth-header\"))"
      ref = "jwt_rl_rule"
      ratelimit = {
        characteristics = [
          "lookup_json_string(http.request.jwt.claims[\"116c0a3d-6be8-43c4-a355-8b2a3704e991\"][0],\"name\")",
          "ip.src",
          "cf.colo.id"
        ]
        mitigation_timeout = 60
        period = 60
        requests_per_period = 5
      }
    }
  ]
}
