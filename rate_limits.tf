resource "cloudflare_ruleset" "ratelimit-root" {
  kind       = "root"
  name       = "default"
  phase      = "http_ratelimit"
  account_id = var.cloudflare_account_id
  
  rules = [
    {
      action      = "execute"
      description = "Account-Level Rate Limit"
      enabled     = true
      expression  = "(cf.zone.plan eq \"ENT\")"
      action_parameters = {
        id = cloudflare_ruleset.rate_limits.id
      }
    }
  ]
}

resource "cloudflare_ruleset" "rate_limits" {
  account_id = var.cloudflare_account_id
  kind = "custom"
  name = "default"
  phase = "http_ratelimit"
  rules = [
    {
      action = "managed_challenge"
      description = "Rate Limit Wordpress Login"
      enabled = true
      expression = "(http.request.uri.path eq \"/wp-login.php\" and http.request.method eq \"POST\")"
      ratelimit = {
        characteristics = [
          "ip.src",
          "cf.colo.id"
        ]
        mitigation_timeout = 300
        period = 60
        requests_per_period = 5
      }
    }
  ]
}
