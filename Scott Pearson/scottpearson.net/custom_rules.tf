resource "cloudflare_ruleset" "custom_rules" {
  kind = "zone"
  name = "default"
  phase = "http_request_firewall_custom"
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  rules = [
    {
      action = "block"
      description = "Block API requests with no authentication"
      enabled = true
      expression = "(not cf.api_gateway.auth_id_present and http.host eq \"api.scottpearson.net\")"
      ref = "api_auth_rule"
    },
    {
      action = "block"
      description = "Enforce mTLS authentication"
      enabled     = true
      expression  = "((not cf.tls_client_auth.cert_verified or cf.tls_client_auth.cert_revoked) and http.host eq \"scottpearson.net\" and http.request.uri.path wildcard r\"/api/*\")"
      ref = "mtls_rule"
    },
    {
      action = "log"
      description = "API Shield Fallthrough rule"
      enabled = true
      expression = "(cf.api_gateway.fallthrough_detected and http.host in {\"api.scottpearson.net\"})"
      ref = "api_fallthrough_rule"
    },
  ]
}
