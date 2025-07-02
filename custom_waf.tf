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
      action = "managed_challenge"
      description = "Mitigate definite bot traffic"
      expression = "(cf.bot_management.score eq 1 and not cf.bot_management.verified_bot and not cf.bot_management.static_resource and not any(http.request.headers[\"scott-test\"][*] eq \"1\"))"
      enabled = true
    } 
  ]
}
