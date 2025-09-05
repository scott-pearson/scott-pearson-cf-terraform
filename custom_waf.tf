resource "cloudflare_ruleset" "custom_waf_root" { 
  account_id = var.cloudflare_account_id
  kind       = "root"
  name       = "default"
  phase      = "http_request_firewall_custom"
  
  rules = [
    {
      action      = "execute"
      description = "Account-Level Custom Rules"
      enabled     = true
      expression  = "(cf.zone.plan eq \"ENT\")"
      action_parameters = {
        id = cloudflare_ruleset.custom_waf.id
      }
    }
  ]
}

resource "cloudflare_ruleset" "custom_waf" {
  account_id  = var.cloudflare_account_id
  kind        = "custom"
  name        = "default"
  phase       = "http_request_firewall_custom"

  rules = [
    {
      action = "skip"
      description = "Allow origin IPs to skip all security rules"
      expression = "(ip.src in $origin_ips)"
      enabled = true
      action_parameters = {
        phases = [
          "http_ratelimit",
          "http_request_firewall_managed"
        ],
        products = [
          "bic",
          "securityLevel"
        ]
        ruleset = "current"
      }
      logging = {
        enabled = true
      }
      ref = "origin_skip"
    },
    {
      action = "block"
      description = "Mitigate requests that have leaked credentials"
      expression = "(cf.waf.credential_check.username_and_password_leaked)"
      enabled = true
      ref = "leaked_creds"
    },
    {
      action = "block"
      description = "Mitigate definite bot traffic [1]"
      expression = "(cf.bot_management.score eq 1 and not cf.bot_management.verified_bot and not cf.bot_management.static_resource and not any(http.request.headers[\"scott-test\"][*] eq \"1\"))"
      enabled = true
      ref = "definite_bots"
    },
    {
      action = "managed_challenge"
      description = "Mitigate likely bot bot traffic [2-29]"
      expression = "(cf.bot_management.score ge 1 and cf.bot_management.score le 29 and not cf.bot_management.verified_bot and not cf.bot_management.static_resource and not any(http.request.headers[\"scott-test\"][*] eq \"1\"))"
      enabled = true
      ref = "likely_bots"
    }
  ]
}
