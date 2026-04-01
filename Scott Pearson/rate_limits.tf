resource "cloudflare_ruleset" "ratelimit-root" {
  kind       = "root"
  name       = "default"
  phase      = "http_ratelimit"
  account_id = cloudflare_account.Scott_Pearson_account.id
  
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
  account_id = cloudflare_account.Scott_Pearson_account.id
  kind = "custom"
  name = "default"
  phase = "http_ratelimit"
  rules = [
    {
      action = "managed_challenge"
      description = "Rate Limit Wordpress Login"
      enabled = true
      expression = "(http.request.uri.path eq \"/wp-login.php\" and http.request.method eq \"POST\")"
      ref = "wordpress_rl_rule"
      ratelimit = {
        characteristics = [
          "ip.src",
          "cf.colo.id"
        ]
        mitigation_timeout = 300
        period = 60
        requests_per_period = 5
        requests_to_origin = "true"
      }
    },
    {
      action = "managed_challenge"
      description = "Rate Limit POST to xmlpc.php"
      enabled = true
      expression = "(http.request.uri.path eq \"/xmlrpc.php\" and http.request.method eq \"POST\")"
      ref = "xmlrpc_rl_rule"
      ratelimit = {
        characteristics = [
          "ip.src",
          "cf.colo.id"
        ]
        mitigation_timeout = 600
        period = 600
        requests_per_period = 20
        requests_to_origin = "true"
      }
    },
    {
      action = "managed_challenge"
      description = "WAF Attack Score Rate Limit"
      enabled = true
      expression = "true"
      ref = "waf_attack_rl_rule"
      ratelimit = {
        characteristics = [
          "ip.src",
          "cf.colo.id"
        ]
        counting_expression = "(cf.waf.score le 50)"
        mitigation_timeout = 3600
        period = 60
        requests_per_period = 10
        requests_to_origin = "false"
      }
    },
    {
      action = "managed_challenge"
      description = "Rate Limit 404s"
      enabled = true
      expression = "true"
      ref = "404_attack_rl_rule"
      ratelimit = {
        characteristics = [
          "ip.src",
          "cf.colo.id"
        ]
        counting_expression = "(http.response.code eq 404)"
        mitigation_timeout = 3600
        period = 60
        requests_per_period = 50
        requests_to_origin = "true"
      }
    }
  ]
}
