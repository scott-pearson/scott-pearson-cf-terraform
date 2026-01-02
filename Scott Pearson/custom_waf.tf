resource "cloudflare_ruleset" "custom_waf_root" { 
  account_id = cloudflare_account.Scott_Pearson_account.id
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
  account_id  = cloudflare_account.Scott_Pearson_account.id
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
      description = "Mitigate definite attacks [1]"
      expression = "(cf.waf.score eq 1)"
      enabled = true
      ref = "def_attack"
    },
    {
      action = "block"
      description = "Mitigate definite bot traffic [1]"
      expression = "(cf.bot_management.score eq 1 and not cf.bot_management.verified_bot and not any(http.request.headers[\"scott-test\"][*] eq \"1\"))"
      enabled = true
      ref = "definite_bots"
    },
    {
      action = "managed_challenge"
      description = "Mitigate likely attacks [2-50]"
      expression = "(cf.waf.score gt 1 and cf.waf.score lt 50)"
      enabled = true
      ref = "likely_attack"
    },
    {
      action = "managed_challenge"
      description = "Mitigate likely bot traffic [2-10]"
      expression = "(cf.bot_management.score gt 1 and cf.bot_management.score lt 11 and not cf.bot_management.verified_bot and not any(http.request.headers[\"scott-test\"][*] eq \"1\"))"
      enabled = true
      ref = "likely_bots2"
    },
    {
      action = "managed_challenge"
      description = "Mitigate likely bot dynamic traffic [11-30]"
      expression = "(cf.bot_management.score gt 10 and cf.bot_management.score lt 31 and not cf.bot_management.verified_bot and not cf.bot_management.static_resource and !cf.bot_management.js_detection.passed and not(any(http.request.headers[\"scott-test\"][*] eq \"1\") or any(http.request.headers[\"cf-worker-zone\"][*] eq \"test.scottpearson.net\")))"
      enabled = true
      ref = "likely_bots"
    }
  ]
}
